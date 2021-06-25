#![feature(proc_macro_hygiene, decl_macro)]
#![recursion_limit = "1024"]

#[macro_use] extern crate rocket;
#[macro_use] extern crate diesel;
#[macro_use] extern crate serde_derive;


use dotenv::dotenv;
use rocket_swagger_ui;
use swagger_ui;

mod accounts;
mod db;

itconfig::config! {
    DATABASE_URL: String
}

fn main() {
  dotenv().ok();

  let mut routes:Vec<rocket::Route> = vec![];
  routes.append(&mut accounts::routes());


  rocket::ignite()
    .manage(db::connect())
    .mount("/api/v1", routes)
    .mount("/api/v1/swagger/",
      rocket_swagger_ui::routes(
          swagger_ui::swagger_spec_file!("./openapi.json"),
          swagger_ui::Config {
            url: "http://localhost:8000/api/v1/swagger/openapi.json".to_string(),
            urls: vec![],
            deep_linking: false,
            display_operation_id: false,
            default_models_expand_depth: 0,
            default_model_expand_depth: 0,
            default_model_rendering: swagger_ui::DefaultModelRendering::Model,
            display_request_duration: false,
            doc_expansion: swagger_ui::DocExpansion::List,
            filter: swagger_ui::Filter::Bool(false),
            max_displayed_tags: 0,
            show_extensions: false,
            show_common_extensions: false
        }
      )
    )
    .launch();
}
