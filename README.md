Overview of Breakout Trading Strategy
A breakout trading strategy aims to capitalize on price movements that occur when an asset (in this case, a currency pair) moves outside a predefined support or resistance level. Traders look for momentum to follow the breakout and generate profit.

We can break the strategy into a few key components:

Identify Support and Resistance Levels: Support and resistance are critical price levels that the market has tested multiple times without breaking.
Set Breakout Conditions: A breakout occurs when the price moves beyond a certain threshold beyond these levels.
Execute Trades: When a breakout happens, place buy or sell orders depending on the direction of the breakout.
Stop-Loss/Take-Profit: Set risk management parameters such as stop-loss and take-profit points to protect the trades.
Required Libraries for Trading System in Rust
To develop this strategy in Rust, you’ll need to leverage libraries for:

Financial Data: You can use data sources like APIs for real-time and historical currency data (e.g., Forex data).
reqwest (for HTTP requests)
serde (for data serialization/deserialization)
Trading Logic: For technical analysis and calculations, you can implement custom logic or use Rust's mathematical libraries.
nalgebra or ndarray (for numerical operations)
Concurrency: If you plan on using real-time data and making decisions instantly, tokio or async-std can help with concurrency.
Error Handling and Logging: Rust’s error handling is robust and can be used for managing errors in live trading.
log and env_logger (for logging)
