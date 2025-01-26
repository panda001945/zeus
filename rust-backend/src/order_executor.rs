use reqwest::blocking::Client;
use std::error::Error;

pub fn execute_order(signal: &str, symbol: &str, price: f64) -> Result<(), Box<dyn Error>> {
    // Logic to send buy/sell orders to MetaTrader or external API
    let url = "https://your-forex-broker-api.com/order"; // Replace with actual broker API

    let order = serde_json::json!({
        "signal": signal,
        "symbol": symbol,
        "price": price
    });

    let client = Client::new();
    let response = client.post(url).json(&order).send()?;

    if response.status().is_success() {
        println!("Order placed successfully: {} {} at price {:.4}", signal, symbol, price);
    } else {
        println!("Failed to place order. Response: {:?}", response);
    }

    Ok(())
}
