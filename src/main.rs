#![feature(proc_macro_hygiene, decl_macro)]
#![recursion_limit = "1024"]

#[macro_use] extern crate rocket;
#[macro_use] extern crate diesel;
#[macro_use] extern crate serde_derive;

use dotenv::dotenv;

mod accounts;
mod db;

itconfig::config! {
    DATABASE_URL: String
}

fn main() {
  dotenv().ok();

  let mut routes:Vec<rocket::Route> = vec![];
  routes.append(&mut accounts::routes());

  rocket::ignite().manage(db::connect()).mount("/api/v1", routes).launch();
}
