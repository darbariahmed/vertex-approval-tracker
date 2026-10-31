-- Vertex Approval Tracker — seed data
-- Run this AFTER 0001_init.sql, once, in the Supabase SQL Editor.

insert into campuses (name, manager_email, principal_email) values
  ('North', 'manager.north@thenextschool.edu.pk', null),
  ('Jamshed Road', 'manager.jamshedroad@thenextschool.edu.pk', 'principal.jamshedroad@thenextschool.edu.pk'),
  ('Gulshan', 'manager.gulshan@thenextschool.edu.pk', 'principal.gulshan@thenextschool.edu.pk'),
  ('PECHS', 'manager.pechs@thenextschool.edu.pk', 'principal.pechs@thenextschool.edu.pk'),
  ('Latifabad', 'manager.latifabad@thenextschool.edu.pk', 'principal.latifabad@thenextschool.edu.pk'),
  ('Bahadurabad', null, 'principal.bahadurabad@thenextschool.edu.pk'),
  ('Johar', null, 'principal.johar@thenextschool.edu.pk')
on conflict do nothing;

-- Request-type keywords: catch new emails from campuses/principals
insert into keywords (phrase, keyword_type) values
  ('approval required', 'request'),
  ('approval', 'request'),
  ('payment approval', 'request'),
  ('requisition approval', 'request'),
  ('requisition', 'request'),
  ('request for', 'request'),
  ('quotations', 'request')
on conflict do nothing;

-- Approval-type keywords: only matched from Hamza Zakaria's own replies
insert into keywords (phrase, keyword_type) values
  ('approved', 'approval'),
  ('please proceed', 'approval'),
  ('this is already incurred.. proceed', 'approval'),
  ('this was approved by me', 'approval'),
  ('let''s proceed with this', 'approval'),
  ('conduct the necessary due diligence and proceed', 'approval')
on conflict do nothing;

-- The approver
insert into users (name, email, role) values
  ('Hamza Zakaria', 'hamza.zakaria@alpha.edu.pk', 'approver'),
  ('Arshad Qureshi', 'arshad.qureshi@thenextschool.edu.pk', 'viewer'),
  ('Amna Asif', 'amna.asif@thenextschool.edu.pk', 'viewer')
on conflict (email) do nothing;
