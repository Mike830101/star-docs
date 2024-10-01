-- 後台使用者主表
create table sys_user
(
    uid                   uuid               primary key,
    acc                   varchar(1024)      unique not null,
    password              varchar(1024)      not null,
    name                  varchar(1024)      not null,
    tel_phone             varchar(1024),
    email                 varchar(1024),
    role_id               uuid               not null,
    status                integer default 1,
    created_time          timestamp          not null,
    created_by            uuid               not null,
    updated_time          timestamp          not null,
    updated_by            uuid               not null,
    last_login_time       timestamp
);

comment on table sys_user is '後台使用者主表';

comment on column sys_user.uid is '鍵值';
comment on column sys_user.password is '密碼';
comment on column sys_user.acc is '帳號,不可重複';
comment on column sys_user.password is '密碼';
comment on column sys_user.name is '使用者姓名';
comment on column sys_user.tel_phone is '使用者電話';
comment on column sys_user.email is '使用者電子郵件';
comment on column sys_user.role_id is '角色id';
comment on column sys_user.status is '帳號狀態 (1: 啟用, 0: 停用)';
comment on column sys_user.created_time is '建立時間';
comment on column sys_user.created_by is '建立者uid';
comment on column sys_user.updated_time is '更新時間';
comment on column sys_user.updated_by is '更新者uid';
comment on column sys_user.last_login_time is '最後登入時間';

alter table sys_user owner to postgres;

create index idx_sys_user_acc on sys_user (acc);
create index idx_sys_user_name on sys_user (name);
create index idx_sys_user_email on sys_user (email);
create index idx_sys_user_role_id on sys_user (role_id);

-- 角色
create table role
(
    uid                 uuid constraint role_pk     primary key,
    name                varchar(100)                not null,
    enable              boolean default true        not null,
    code                varchar(20)                 not null unique,
    memo                varchar(1024)
);

comment on table role is '使用者角色';
comment on column role.uid is '鍵值';
comment on column role.name is '角色名稱';
comment on column role.enable is '啟用/停用';
comment on column role.code is '角色代碼';
comment on column role.memo is '備註';

alter table role owner to postgres;

create index idx_role_id on role (uid);
create index idx_role_name on role (name);
create index idx_role_enable on role (enable);
create index idx_role_code on role (code);
-- 創建初始資料
INSERT INTO public.role (uid, name, enable,code, memo) VALUES ('3ee3b17c-1804-11ef-aee0-02e6d1dfeef3', '系統管理者', true, 'admin',  '系統平臺的管理人員');
INSERT INTO public.role (uid, name, enable,code, memo) VALUES ('3ee3b173-1804-11ef-aee0-02e6d1dfeef3', '一般帳號', true, 'user', '一般使用者');




-- 機關單位總表
-- create table provider
-- (
--     uid             uuid not null primary key,
--     name                    varchar(50),
--     status                  integer,
--     type                    integer,
--     code                    varchar(8) unique,
--     created_time            timestamp not null,
--     created_by              uuid not null,
--     updated_time            timestamp not null,
--     updated_by              uuid not null
-- );
--
-- comment on table provider is '機關單位總表';
--
-- comment on column provider.uid is '鍵值';
-- comment on column provider.name is '單位名稱';
-- comment on column provider.status is '狀態。0停用，1啟用。';
-- comment on column provider.type is '機關類型';
-- comment on column provider.code is '機關代碼,唯一值';
-- comment on column provider.created_time is '建立時間';
-- comment on column provider.created_by is '建立者uid';
-- comment on column provider.updated_time is '更新時間';
-- comment on column provider.updated_by is '更新者uid';
--
-- alter table provider owner to postgres;
--
-- create index idx_provider_uid on provider (uid);
-- create index idx_provider_status on provider (status);
-- create index provider_name_index on provider (name);
-- create index idx_provider_type on provider (type);
-- create index idx_provider_code on provider (code);