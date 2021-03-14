/*
    [[  Dynamic Bitcoin by LionDaDev  ]]

    Feel free to edit or redistribute, just make sure to credit me
    Feel free to use this code somewhere else, just credit me
    Honestly, I dont care what you do with this just make sure you credit me

    use dynamicbitcoin_update to force an update (server console only)
*/

dynamicbitcoin                      = dynamicbitcoin or {} // Ignore me!

/*
    What URL should the API use
    This must return JSON

    Currently it uses blockchain API, so you should be able to use this.
*/
dynamicbitcoin.apiURL               = "https://api.blockchain.com/v3/exchange/tickers/BTC-USD"

/*
    Language settings for places other then engrish
*/
dynamicbitcoin.lang = {}
dynamicbitcoin.lang["price"]        = "Bitcoin Price"

/*
    What should the delay be to update this

    I would recomend five minuites, doing it too fast could cause server strain!
*/
dynamicbitcoin.apiDelay             = 300 // 300 seconds = Five minuites

/*
    Theme settings, used for the UI and board
*/
dynamicbitcoin.theme                = {}
dynamicbitcoin.theme["background"]  = Color(30, 30, 30)
dynamicbitcoin.theme["price_sub"]   = Color(52, 152, 219)
dynamicbitcoin.theme["price"]       = Color(46, 204, 113)
dynamicbitcoin.theme["chat_prefix"] = Color(255, 75, 75)
dynamicbitcoin.theme["chat_msg"]    = Color(200, 200, 200)
dynamicbitcoin.theme["chat_error"]  = Color(75, 255, 75)

/*
    Icon drawn behind the info
*/
dynamicbitcoin.icon                 = "https://i.imgur.com/fxfZ4tz.png"

/*
    Command for checking bitcoin info
*/
dynamicbitcoin.cmd = "/bitcoin"

/*
    How much should we devie the price from blockchain
*/
dynamicbitcoin.devide               = 7

/*
    Defualt price for bitcoin
*/
dynamicbitcoin.currentPrice         = 5000

/*
    Function to call when the price updates

    NOTE: This is a shared function
*/
dynamicbitcoin.updateFunc = function(price)
    BM2CONFIG.BitcoinValue = price / dynamicbitcoin.devide // Bitminers 2

    if (SERVER) then
        dynamicbitcoin.networkPriceChange()
    end 
end