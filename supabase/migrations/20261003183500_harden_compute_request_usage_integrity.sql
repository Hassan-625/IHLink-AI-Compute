create unique index if not exists compute_jobs_one_per_order on public.compute_jobs(order_id);
create or replace function private.validate_compute_job_order() returns trigger language plpgsql set search_path='' as $$
begin
 if not exists(select 1 from public.business_orders o where o.id=new.order_id and o.unit_code='compute') then raise exception 'Compute job must belong to a compute order'; end if;
 if new.estimated_hours is not null and new.estimated_hours<=0 then raise exception 'Estimated hours must be positive'; end if; return new;
end $$;
drop trigger if exists validate_compute_job_order on public.compute_jobs;
create trigger validate_compute_job_order before insert or update on public.compute_jobs for each row execute function private.validate_compute_job_order();
create or replace function private.validate_compute_usage_order() returns trigger language plpgsql set search_path='' as $$
begin
 if not exists(select 1 from public.compute_jobs j join public.business_orders o on o.id=j.order_id where j.order_id=new.order_id and o.unit_code='compute') then raise exception 'Usage must belong to an existing compute job'; end if;
 if coalesce(new.hours,0)<0 or coalesce(new.credits_used,0)<0 then raise exception 'Usage values cannot be negative'; end if; return new;
end $$;
drop trigger if exists validate_compute_usage_order on public.compute_usage_records;
create trigger validate_compute_usage_order before insert or update on public.compute_usage_records for each row execute function private.validate_compute_usage_order();