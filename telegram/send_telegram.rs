use reqwest::blocking::{Client, Response};
use serde::Serialize;
use std::error::Error;

#[derive(Serialize)]
struct TelegramMessage<'a> {
    chat_id: &'a str,
    text: &'a str,
}

pub fn send_telegram_message(token: &str, chat_id: &str, message: &str) -> Result<Response, Box<dyn Error>> {
    let url =
