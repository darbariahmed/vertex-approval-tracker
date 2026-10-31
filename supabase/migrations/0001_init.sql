-- Vertex Approval Tracker — Phase 1 schema
-- Run this once in Supabase: SQL Editor -> New query -> paste -> Run

create table if not exists campuses (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  manager_email text,
  principal_email text,
  created_at timestamptz default now()
);

create table if not exists users (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  email text not null unique,
  role text not null check (role in ('admin','approver','finance','viewer')),
  created_at timestamptz default now()
);

create table if not exists keywords (
  id uuid primary key default gen_random_uuid(),
  phrase text not null,
  keyword_type text not null check (keyword_type in ('request','approval')),
  active boolean default true,
  created_at timestamptz default now()
);

create table if not exists payment_requests (
  id uuid primary key default gen_random_uuid(),
  campus_name text not null,
  sender_email text not null,
  sender_role text check (sender_role in ('manager','principal')),
  subject text not null,
  request_type text check (request_type in ('payment','expense','requisition','quotation','event')),
  email_received_at timestamptz,
  status text not null default 'new' check (status in ('new','forwarded','approved','rejected','overdue','paid')),
  amount numeric,
  description text,
  created_at timestamptz default now()
);

create table if not exists approvals (
  id uuid primary key default gen_random_uuid(),
  request_id uuid references payment_requests(id) on delete cascade,
  approver_name text,
  approver_email text,
  decision text check (decision in ('approved','rejected')),
  matched_phrase text,
  approved_at timestamptz,
  note text,
  created_at timestamptz default now()
);

create table if not exists cheques (
  id uuid primary key default gen_random_uuid(),
  request_id uuid references payment_requests(id) on delete cascade,
  cheque_no text,
  cheque_date date,
  bank_name text,
  prepared_by text,
  handed_over_at timestamptz,
  created_at timestamptz default now()
);

-- Row Level Security: on by default, no public access yet.
-- Policies get added in a later phase once login is built.
alter table campuses enable row level security;
alter table users enable row level security;
alter table keywords enable row level security;
alter table payment_requests enable row level security;
alter table approvals enable row level security;
alter table cheques enable row level security;
