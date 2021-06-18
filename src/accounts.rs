use diesel::result::Error;
use rocket::http::Status;
use rocket_contrib::json::Json;

use crate::db::models::{NewUser, User};
use crate::db::Connection;

#[get("/users")]
fn all_users(
  connection: Connection,
) -> Result<Json<Vec<User>>, Status> {
  User::get_all_users(&connection)
    .map(|user| Json(user))
    .map_err(|error| error_status(error))
}

#[get("/users/<id>")]
fn get_user(
  id: i64,
  connection: Connection,
) -> Result<Json<User>, Status> {
  User::get_user(id, &connection)
    .map(|user| Json(user))
    .map_err(|error| error_status(error))
}

#[post(
  "/users/create",
  format = "application/json",
  data = "<new_user>"
)]
fn create_user(
  connection: Connection,
  new_user: Json<NewUser>,
) -> Result<Json<User>, Status> {
  User::create(new_user.into_inner(), &connection)
    .map(|user| Json(user))
    .map_err(|error| {
      println!("{:?}", error);
      error_status(error)
    })
}
pub fn routes() -> Vec<rocket::Route> {
  rocket::routes![all_users, get_user, create_user]
}

fn error_status(error: Error) -> Status {
  match error {
    Error::NotFound => Status::NotFound,
    _ => Status::InternalServerError,
  }
}
