-- Create the users table
create table users (
  id uuid references auth.users not null,
  primary key (id),
  email varchar(255) not null,
  role varchar(255) not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Create a trigger to automatically insert a new user into the users table when a new user signs up
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.users (id, email, role)
  values (new.id, new.email, new.raw_user_meta_data->>'user_type');
  return new;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- Create the questions table
create table questions (
  id uuid primary key default uuid_generate_v4(),
  subject varchar(255) not null,
  class int not null,
  chapter varchar(255) not null,
  subtopic varchar(255),
  question_type varchar(255) not null,
  difficulty varchar(255) not null,
  bloom_taxonomy varchar(255) not null,
  exam_pattern varchar(255) not null,
  question_text text not null,
  options text[],
  correct_answer text not null,
  explanation text,
  generated_at timestamptz not null default now(),
  user_id uuid references users not null
);

-- Create the classrooms table
create table classrooms (
  id uuid primary key default uuid_generate_v4(),
  teacher_id uuid references users not null,
  name varchar(255) not null,
  students uuid[]
);

-- Create the quizzes table
create table quizzes (
  id uuid primary key default uuid_generate_v4(),
  teacher_id uuid references users not null,
  classroom_id uuid references classrooms,
  questions uuid[]
);
