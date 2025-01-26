use serde::Deserialize;

#[derive(Deserialize)]
pub struct CurrencyData {
    time: String,
    close: f64,
}

pub fn breakout_strategy(data: &[CurrencyData], period: usize, buffer: f64) -> Option<String> {
    let len = data.len();
    if len < period {
        return None; // Not enough data for the breakout strategy
    }

    // Calculate the highest high and lowest low over the given period
    let highest_high = data[len - period..]
        .iter()
        .map(|d| d.close)
        .fold(f64::MIN, f64::max);

    let lowest_low = data[len - period..]
        .iter()
        .map(|d| d.close)
        .fold(f64::MAX, f64::min);

    let current_price = data[len - 1].close;

    if current_price > highest_high + buffer {
        Some("Buy".to_string()) // Breakout Buy Signal
    } else if current_price < lowest_low - buffer {
        Some("Sell".to_string()) // Breakout Sell Signal
    } else {
        None // No signal
    }
}
