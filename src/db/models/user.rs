use diesel;
use diesel::prelude::*;
use diesel::PgConnection;
use chrono::NaiveDateTime;

pub use crate::db::schema::users;

#[derive(AsChangeset, Queryable, Identifiable, Debug, Clone, PartialEq, Serialize, Deserialize)]
#[table_name = "users"]
pub struct User {
  pub id: i64,
  pub name: Option<String>,
  pub mail: Option<String>,
  pub password: Option<String>,
  pub inserted_at: NaiveDateTime,
  pub updated_at: NaiveDateTime,
}

#[derive(Debug, Insertable, Serialize, Deserialize)]
#[table_name = "users"]
pub struct NewUser {
  pub name: String,
  pub mail: String,
  pub password: String,
}

impl User {
  // pub fn create(
  //   new_user: NewUser,
  //   connection: &PgConnection,
  // ) -> QueryResult<User> {
  //   diesel::insert_into(users::table).values(&new_user).get_result(connection)
  // }

  // pub fn get_user(id: i32, connection: &PgConnection) -> QueryResult<User> {
  //   users::table.find(id).first::<User>(connection)
  // }

  pub fn get_all_users(connection: &PgConnection) -> QueryResult<Vec<User>> {
    users::table.order(users::id).load::<User>(connection)
  }

  // pub fn update(id: i32, user: User, connection: &PgConnection) -> bool {
  // diesel::update(users::table.find(id))
  //     .set(&user)
  //     .execute(connection)
  //     .is_ok()
  // }
}
