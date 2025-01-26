use reqwest::blocking::get;
use serde::Deserialize;
use std::error::Error;

#[derive(Deserialize, Debug)]
pub struct CurrencyData {
    time: String,
    close: f64,
}

pub fn fetch_currency_data(symbol: &str, period: &str) -> Result<Vec<CurrencyData>, Box<dyn Error>> {
    // Example URL, replace with actual Forex API endpoint
    let url = format!("https://api.forex.com/data?symbol={}&period={}", symbol, period);
    let response = get(&url)?.json::<Vec<CurrencyData>>()?;
    Ok(response)
}
