use chrono::NaiveDateTime;
use diesel;
use diesel::prelude::*;
use diesel::select;
use diesel::PgConnection;

pub use crate::db::schema::users;

#[derive(
  AsChangeset,
  Insertable,
  Queryable,
  Identifiable,
  Debug,
  Clone,
  PartialEq,
  Serialize,
  Deserialize,
)]
#[table_name = "users"]
pub struct User {
  pub id: i64,
  pub name: Option<String>,
  pub mail: Option<String>,
}

#[derive(Debug, Insertable, Serialize, Deserialize)]
#[table_name = "users"]
pub struct NewUser {
  pub name: String,
  pub mail: String,
  pub password: String,
}

impl User {
  pub fn create(
    new_user: NewUser,
    connection: &PgConnection,
  ) -> QueryResult<User> {
    let now = select(diesel::dsl::now)
      .get_result::<NaiveDateTime>(connection)?;
    diesel::insert_into(users::table)
      .values((
        &new_user,
        users::inserted_at.eq(now),
        users::updated_at.eq(now),
      ))
      .returning((users::id, users::name, users::mail))
      .get_result(connection)
  }

  pub fn get_user(
    id: i64,
    connection: &PgConnection,
  ) -> QueryResult<User> {
    users::table
      .select((users::id, users::name, users::mail))
      .find(id)
      .first::<User>(connection)
  }

  pub fn get_all_users(
    connection: &PgConnection,
  ) -> QueryResult<Vec<User>> {
    users::table
      .select((users::id, users::name, users::mail))
      .order(users::id)
      .load::<User>(connection)
  }

  // pub fn update(id: i32, user: User, connection: &PgConnection) -> bool {
  // diesel::update(users::table.find(id))
  //     .set(&user)
  //     .execute(connection)
  //     .is_ok()
  // }
}
