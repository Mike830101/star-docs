-- 選單項目主表
-- create table select_options
-- (
--     uid      uuid           constraint pk_select_options primary key,
--     value    varchar(50)    not null,
--     text     varchar(50)    not null,
--     apply_to varchar(25)    not null
-- );
--
-- comment on table select_options is '選單項目主表';
--
-- comment on column select_options.uid is '鍵值';
-- comment on column select_options.value is '項目值';
-- comment on column select_options.text is '項目文字';
-- comment on column select_options.apply_to is '適用於。 如：provider_type 機關類型。';
--
-- alter table select_options owner to postgres;

-- 管理後台操作記錄
create table backend_log
(
    uid           uuid              primary key,
    module        varchar(50),
    operation     varchar(25),
    func_item     varchar(50),
    action_text   text,
    data_before   text,
    data_after    text,
    created_time  timestamp         not null,
    created_by    uuid              not null
);

comment on table backend_log is '管理後台操作記錄';

comment on column backend_log.uid is '鍵值';
comment on column backend_log.module is '服務模組代碼';
comment on column backend_log.operation is '操作代碼';
comment on column backend_log.func_item is '功能項目代碼';
comment on column backend_log.data_before is '異動前的資料內容';
comment on column backend_log.data_after is '異動後的資料內容';
comment on column backend_log.created_time is '建立時間';
comment on column backend_log.created_by is '建立者uid';

alter table backend_log owner to postgres;

create index idx_backend_log_module on backend_log (module);
create index idx_backend_log_operation on backend_log (operation);
create index idx_backend_log_func_item on backend_log (func_item);
create index idx_backend_log_created_by on backend_log (created_by);