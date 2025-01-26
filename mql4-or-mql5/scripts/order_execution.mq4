// Define input parameters
input string symbol = "EURUSD";   // Trading pair
input double lot_size = 0.1;      // Trading lot size
input int slippage = 3;           // Max slippage allowed for orders
input double stop_loss = 50;      // Stop loss in pips
input double take_profit = 100;   // Take profit in pips
input int magic_number = 12345;   // Magic number for the order
input string order_signal = "Buy"; // Signal received from the Rust backend (e.g., "Buy" or "Sell")

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   // Execute order based on signal
   if (order_signal == "Buy")
     {
      ExecuteBuyOrder();
     }
   else if (order_signal == "Sell")
     {
      ExecuteSellOrder();
     }
   else
     {
      Print("Invalid signal received: ", order_signal);
     }

   return INIT_SUCCEEDED;
  }
//+------------------------------------------------------------------+
//| Function to execute Buy order                                     |
//+------------------------------------------------------------------+
void ExecuteBuyOrder()
  {
   double price = Ask;
   double stop_loss_price = price - stop_loss * Point;
   double take_profit_price = price + take_profit * Point;

   // Place the Buy order
   int ticket = OrderSend(symbol, OP_BUY, lot_size, price, slippage, stop_loss_price, take_profit_price, "Buy Order", magic_number, 0, Green);

   if (ticket < 0)
     {
      Print("Error placing Buy order: ", GetLastError());
     }
   else
     {
      Print("Buy order placed successfully with ticket #", ticket);
     }
  }
//+------------------------------------------------------------------+
//| Function to execute Sell order                                    |
//+------------------------------------------------------------------+
void ExecuteSellOrder()
  {
   double price = Bid;
   double stop_loss_price = price + stop_loss * Point;
   double take_profit_price = price - take_profit * Point;

   // Place the Sell order
   int ticket = OrderSend(symbol, OP_SELL, lot_size, price, slippage, stop_loss_price, take_profit_price, "Sell Order", magic_number, 0, Red);

   if (ticket < 0)
     {
      Print("Error placing Sell order: ", GetLastError());
     }
   else
     {
      Print("Sell order placed successfully with ticket #", ticket);
     }
  }
//+------------------------------------------------------------------+
