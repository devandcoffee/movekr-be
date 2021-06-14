use diesel::result::Error;
use rocket_contrib::json::{Json};
use rocket::http::Status;

use crate::db::models::User;
use crate::db::Connection;

#[get("/users")]
fn all_users(connection: Connection) -> Result<Json<Vec<User>>, Status> {
  User::get_all_users(&connection).map(|user| Json(user)).map_err(|error| error_status(error))
}

pub fn routes() -> Vec<rocket::Route> {
  rocket::routes![all_users]
}

fn error_status(error: Error) -> Status {
    match error {
        Error::NotFound => Status::NotFound,
        _ => Status::InternalServerError
    }
}
