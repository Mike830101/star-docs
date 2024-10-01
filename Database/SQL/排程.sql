-- 系統排程主表
create table routines
(
    uid              uuid                       constraint pk_routines primary key,
    name             varchar(100)               not null,
    enabled          boolean default false      not null,
    setting          text,
    created_time     timestamp                  not null,
    updated_time     timestamp,
    memo             varchar(1024),
    code             varchar(12)                not null unique
);

comment on table routines is '系統排程主表';

comment on column routines.uid is '鍵值';
comment on column routines.name is '系統排程名稱';
comment on column routines.enabled is '是否啟用。 true啟用，false停用';
comment on column routines.setting is '觸發條件設定。 JSON 字串。';
comment on column routines.created_time is '建立時間';
comment on column routines.updated_time is '最後更新時間';
comment on column routines.memo is '備註說明';
comment on column routines.code is '系統排程識別代碼';

alter table routines owner to postgres;

create index idx_routines_enabled on routines (enabled);
create index idx_routines_code on routines (code);

-- 系統排程觸發記錄
create table routine_logs
(
    uid         uuid              not null constraint pk_routine_logs primary key,
    routine_uid uuid              not null,
    start_time  timestamp         not null,
    end_time    timestamp,
    status      varchar(12)       not null
);

comment on table routine_logs is '系統排程觸發記錄';

comment on column routine_logs.uid is '鍵值';
comment on column routine_logs.routine_uid is '系統排程鍵值';
comment on column routine_logs.start_time is '排程觸發時間';
comment on column routine_logs.end_time is '排程執行結束時間';
comment on column routine_logs.status is '執行狀態。 running 執行中、success 執行成功、failed 執行失敗。';
comment on column routine_logs.status is '執行狀態。 running 執行中、success 執行成功、failed 執行失敗。';

alter table routine_logs owner to postgres;

create index idx_routine_logs_routine_uid on routine_logs (routine_uid);
create index idx_routine_logs_status on routine_logs (status);
create index idx_routine_logs_start_time on routine_logs (start_time);
create index idx_routine_logs_end_time on routine_logs (end_time);



