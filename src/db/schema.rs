table! {
    columns (id) {
        id -> Int8,
        name -> Nullable<Varchar>,
        order -> Nullable<Int4>,
        project_id -> Nullable<Int8>,
        inserted_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

table! {
    projects (id) {
        id -> Int8,
        name -> Nullable<Varchar>,
        description -> Nullable<Varchar>,
        owner_id -> Nullable<Int8>,
        inserted_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

table! {
    tasks (id) {
        id -> Int8,
        description -> Nullable<Varchar>,
        start_date -> Nullable<Date>,
        end_date -> Nullable<Date>,
        status -> Bool,
        column_id -> Nullable<Int8>,
        project_id -> Nullable<Int8>,
        inserted_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

table! {
    users (id) {
        id -> Int8,
        name -> Nullable<Varchar>,
        mail -> Nullable<Varchar>,
        password -> Nullable<Varchar>,
        inserted_at -> Timestamp,
        updated_at -> Timestamp,
    }
}

joinable!(columns -> projects (project_id));
joinable!(projects -> users (owner_id));
joinable!(tasks -> columns (column_id));
joinable!(tasks -> projects (project_id));

allow_tables_to_appear_in_same_query!(columns, projects, tasks, users,);
