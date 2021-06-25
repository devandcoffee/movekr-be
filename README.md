# Movekr

Before start you need install [rustup](https://rustup.rs/)

- Install the nightly version of rust with `rustup default nightly`
- Install dependencies and run the development server with `cargo run`
- To use a live reloading you can install **cargo-watch** with `cargo install cargo-watch`
  and then use it with `cargo-watch -x run`

  - If there is an error that says something like _cannot find -lpq_ you need to install **libpq-dev** package

Now you can test the API located in [`localhost:8000/api/v1`](http://localhost:8000/api/v1) from your client.

## Endpoints

### GET All Users (/users)

#### Response

```json
[
  {
    "id": 1,
    "name": "Facundo Flores",
    "mail": "fflores@devandcoffee.org"
  },
  {
    "id": 2,
    "name": "Matias Novoa",
    "mail": "mnovoa@devandcoffee.org"
  },
  ...
]
```

### GET One Users (/users/\<id>)

#### Response

```json
{
  "id": 1,
  "name": "Facundo Flores",
  "mail": "fflores@devandcoffee.org"
}
```

### Create One User (/users/create)

#### Body

```json
{
  "name": "test 2",
  "mail": "test2@test.com",
  "password": "12345"
}
```

#### Response

```json
{
  "id": 10,
  "name": "test 2",
  "mail": "test2@test.com"
}
```
