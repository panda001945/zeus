// Define input parameters
input string signal_url = "http://127.0.0.1:8000/get_signal";  // URL of the Rust backend API
input double lot_size = 0.1;
input string symbol = "EURUSD";
input double stop_loss = 50;   // in pips
input double take_profit = 100; // in pips
input int slippage = 3;

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Fetch signal from the Rust backend
   string signal = GetSignalFromRust(signal_url);

   if (signal == "Buy" || signal == "Sell")
     {
      PlaceOrder(signal, symbol, lot_size, stop_loss, take_profit);
     }
   else
     {
      Print("Invalid signal received: ", signal);
     }

   return INIT_SUCCEEDED;
  }
//+------------------------------------------------------------------+
//| Fetch signal from Rust API                                       |
//+------------------------------------------------------------------+
string GetSignalFromRust(string url)
  {
   char result[];
   string header = "Content-Type: application/json\r\n";
   int res = WebRequest("GET", url, NULL, 10, result, NULL, NULL);

   if (res > 0)
     {
      string response = CharArrayToString(result);
      Print("Received signal: ", response);
      if (StringFind(response, "Buy") != -1)
         return "Buy";
      else if (StringFind(response, "Sell") != -1)
         return "Sell";
     }
   return "";
  }
//+------------------------------------------------------------------+
//| Place the order (Buy/Sell)                                        |
//+------------------------------------------------------------------+
void PlaceOrder(string signal, string symbol, double lot_size, double sl, double tp)
  {
   int ticket;
   double price = MarketInfo(symbol, MODE_ASK);
   if (signal == "Buy")
     {
      ticket = OrderSend(symbol, OP_BUY, lot_size, price, slippage, price - sl * Point, price + tp * Point, "Buy Order", 0, 0, clrGreen);
      if (ticket < 0)
        {
         Print("Error placing Buy order: ", GetLastError());
        }
      else
        {
         Print("Buy order placed successfully.");
        }
     }
   else if (signal == "Sell")
     {
      ticket = OrderSend(symbol, OP_SELL, lot_size, price, slippage, price + sl * Point, price - tp * Point, "Sell Order", 0, 0, clrRed);
      if (ticket < 0)
        {
         Print("Error placing Sell order: ", GetLastError());
        }
      else
        {
         Print("Sell order placed successfully.");
        }
     }
  }
