require 'httparty'
require 'json'

coins = ["EOS","TRX","VEN","ICX","OMG","PPT","BNB","SNT","MKR","AE","REP","VERI","WTC","ZRX","KCS","RHOC","DGD","R","KNC","LRC","DRGN","DCN","BTM","ZIL","ETHOS","ELF","QASH","NAS","GNT","POWR","PLR","IOST","FUN","CND","DENT","SALT","AION","KIN","BNT","ENG","PAY","WAX","AGI","QSP","REQ","XPA","ICN","GNO","SUB","CVC","LINK","STORJ","POE","DEW","MANA","TNB","STORM","ANT","ENJ","RLC","PPP","SRN","VEE","PRL","COB","SPHTX","BLZ","MCO","C20","AST","BIX","ITC","VIBE","JNT","SNGLS","LEND","ADX","SPANK","MDS","SNM","CMT","TEL","MTL","OST","AMB","PRL","THETA","UTK","WABI","EDG","MGO","MLN","APPC","INS","TNT","NULS","CTR","DATA","CDT","ATM","MOD","UKG","EDO","FUEL","NGC","WINGS","GVT","IDH","PAYX","DNT","BRD","TSL","TRAC","ADT","HST","HVN","COSS","PRE","CAPP","TKN","DAT","TAAS","GRID","1ST","OCN","CV","VIB","DPY","LUN","GTO","BDG","CFI","NET","SWFTC","TRST","TIX","IPL","MTH","BMC","HMQ","BLT","ZSC","TAU","IXT","TIO","SNC","EVX","CAT","ART","KEY","WRC","LA","BCAP","ORME","GUP","CREDO","DLT","NEU","MOT","PRO","QUN","PLC","NMR","LIFE","SOAR","GTC","CAN","DRT","MYB","DNA","HKN","SWT","ARN","AURA","AIR","HGT","VOISE","MSP","UQC","COV","STX","PKT","SNOV","EBTC","BMC","MEE","PST","KICK","STAR","DICE","TGT","BNTY","OAX","POLL","NXC","HOT","PRG","CSNO","LOC","PRO","PLBT","XAUR","VIU","ICOS","BLUE","HBT","GET","TIME","QAU","AIT","DBET","ALIS","DAI","RNT","SPF","AVT","XUC","BPT","RVT","PTOY","IFT","XNN","HDG","GAT","MYST","ELIX","BQ","DIVX","LEV","SPF","GMT","CAT","EVR","PLU","ARY","DOVU","DRP","HORSE","PBL","CAG","NIO","FLIXX","AIX","PFR","ING","ASTRO","PIX","WISH","B2B","TIE","XRL","PGL","ERO","CRED","PLAY","BBT","SSS","EVC","ADST","CPAY","EVE","REAL","FLIK","ATL","ARC","ONG","SCL","GJC","CRB","DGPT","WILD","CL","PRIX","OPT","TFL","BET","SMART","INXT","FYP","UFR","AMM","MCAP","QVT","REX","VSL","TRCT","PYLNT","BON","FRD","IND","WAND","GOOD","MBRS","DAY","ETBS","FYN","LCT","STU","GIM","NDC","JET","KBR","RIYA","SKIN","CTX","ECASH","EBET","LNK","SUR","LGD","PIPL","TKR","FUCK","ERC20","STRC","ACE","ATS","SCT","EBCH","EPY","ETG","WTT","NIMFA","BPC","RLT","MNE","IETH","NEWB","SDRN","CCT","HAT","SGR","NTO","ZCG","CCO","TRDT","EREAL","POS","NTWK","DALC","300","E4ROW","BLN","XNG","EAGLE","BRAT","EGAS","BAS","RMC","ICE","CRTM","VRS","EXN","CTIC3","FXE","NDAO","EXRN","CASH","BLX","HYTV","FOTA","AID","PXS","AXP","MCI","RUFF","SND","COFI","IQT","LTG","DTA","FUDD","ABC","EKT","CRPT","IBTC","GUESS","TBX","NTC","BTCS","ATN","IPC","XIN","CHSB","DMT","BTCM","WPR","ELITE","ZLA","MTN","SWM","DXT","DRPU","ADB","PLX","EQL","REBL","CPC","CXO","VLC","SENSE","STK","POLY","XMRG","MCR","ESZ","SWP","FAIR","LLT","UGC","UGT","BTE","BTCA","WETH","ZAP","VZT","BKX","CLD","GNX","AI","AIDOC","TCT","FDX","GCS","MTX","BIG","SMT","CMS","EKO","BTO","XID","BCDN","OX","BTC2X","YEE","STC","READ","HDLB","WIC","MAG","EBIT","IDXM","REF","FAP","MVC","EUSD","MOAC","GUC","EDT","QUBE","IDT","EGOLD","FC","ARCT","PRPS","NOX"]

target_tokens = ["EOS", "TRX", "VEN", "ICX", "PPT", "BNB", "MKR", "AE", "VERI", "WTC", "ZRX", "KCS", "RHOC", "R", "KNC", "LRC", "DRGN", "DCN", "BTM", "ZIL", "ETHOS", "ELF", "QASH", "NAS", "PLR", "IOST", "CND", "DENT", "AION", "KIN", "WAX", "AGI", "QSP", "REQ", "XPA", "ICN", "SUB", "LINK", "POE", "DEW", "TNB", "STORM", "ENJ", "PPP", "SRN", "VEE", "PRL", "COB", "SPHTX", "BLZ", "C20", "AST", "BIX", "ITC", "VIBE", "JNT", "LEND", "SPANK", "MDS", "SNM", "CMT", "TEL", "OST", "AMB", "PRL", "THETA", "UTK", "WABI", "MGO", "APPC", "INS", "TNT", "NULS", "CTR", "DATA", "CDT", "ATM", "MOD", "EDO", "FUEL", "NGC", "GVT", "IDH", "PAYX", "BRD", "TSL", "TRAC", "HST", "HVN", "COSS", "PRE", "CAPP", "DAT", "TAAS", "GRID", "OCN", "CV", "DPY", "GTO", "BDG", "NET", "SWFTC", "IPL", "MTH", "BMC", "BLT", "ZSC", "TAU", "IXT", "TIO", "SNC", "EVX", "CAT", "ART", "KEY", "WRC", "LA", "BCAP", "ORME", "CREDO", "DLT", "NEU", "MOT", "PRO", "QUN", "PLC", "LIFE", "SOAR", "GTC", "CAN", "DRT", "MYB", "DNA", "HKN", "ARN", "AURA", "AIR", "HGT", "VOISE", "MSP", "UQC", "COV", "STX", "PKT", "SNOV", "EBTC", "BMC", "MEE", "PST", "KICK", "STAR", "DICE", "TGT", "BNTY", "OAX", "POLL", "HOT", "PRG", "CSNO", "LOC", "PRO", "PLBT", "VIU", "ICOS", "BLUE", "HBT", "GET", "QAU", "AIT", "DBET", "ALIS", "DAI", "RNT", "SPF", "AVT", "XUC", "BPT", "RVT", "IFT", "XNN", "HDG", "GAT", "ELIX", "BQ", "DIVX", "LEV", "SPF", "GMT", "CAT", "EVR", "PLU", "ARY", "DOVU", "DRP", "HORSE", "PBL", "CAG", "NIO", "FLIXX", "AIX", "PFR", "ING", "ASTRO", "PIX", "WISH", "B2B", "TIE", "XRL", "PGL", "ERO", "CRED", "PLAY", "BBT", "SSS", "EVC", "ADST", "CPAY", "EVE", "REAL", "FLIK", "ATL", "ARC", "ONG", "SCL", "GJC", "DGPT", "WILD", "CL", "PRIX", "OPT", "TFL", "BET", "SMART", "INXT", "FYP", "UFR", "AMM", "MCAP", "QVT", "REX", "VSL", "TRCT", "PYLNT", "BON", "FRD", "IND", "WAND", "GOOD", "MBRS", "DAY", "ETBS", "FYN", "LCT", "STU", "GIM", "NDC", "JET", "KBR", "RIYA", "SKIN", "CTX", "ECASH", "EBET", "LNK", "SUR", "PIPL", "TKR", "FUCK", "ERC20", "STRC", "ACE", "ATS", "SCT", "EBCH", "EPY", "ETG", "WTT", "NIMFA", "BPC", "RLT", "MNE", "IETH", "NEWB", "SDRN", "CCT", "HAT", "SGR", "NTO", "ZCG", "CCO", "TRDT", "EREAL", "POS", "NTWK", "DALC", "300", "E4ROW", "BLN", "XNG", "EAGLE", "BRAT", "EGAS", "BAS", "RMC", "ICE", "CRTM", "VRS", "EXN", "CTIC3", "FXE", "NDAO", "EXRN", "CASH", "BLX", "HYTV", "FOTA", "AID", "PXS", "AXP", "MCI", "RUFF", "SND", "COFI", "IQT", "LTG", "DTA", "FUDD", "ABC", "EKT", "CRPT", "IBTC", "GUESS", "TBX", "NTC", "BTCS", "ATN", "IPC", "XIN", "CHSB", "DMT", "BTCM", "WPR", "ELITE", "ZLA", "MTN", "SWM", "DXT", "DRPU", "ADB", "PLX", "EQL", "REBL", "CPC", "CXO", "VLC", "SENSE", "STK", "POLY", "XMRG", "MCR", "ESZ", "SWP", "FAIR", "LLT", "UGC", "UGT", "BTE", "BTCA", "WETH", "ZAP", "VZT", "BKX", "CLD", "GNX", "AI", "AIDOC", "TCT", "FDX", "GCS", "MTX", "BIG", "SMT", "CMS", "EKO", "BTO", "XID", "BCDN", "OX", "BTC2X", "YEE", "STC", "READ", "HDLB", "WIC", "MAG", "EBIT", "IDXM", "REF", "FAP", "MVC", "EUSD", "MOAC", "GUC", "EDT", "QUBE", "IDT", "EGOLD", "FC", "ARCT", "PRPS", "NOX"]

target_tokens.map! { |token| token.downcase}

# resource
# https://liqui.io/api

# template for api requests
# https://api.liqui.io/api/3/<method name>/<pair listing>
# pair listing example: eth_btc
# multiple pairs exmpale: eth_btc-ltc_btc
liqui_base_api = "https://api.liqui.io/api/3/"

# get all the pairs from liqui
url = liqui_base_api + 'info/'
response =  HTTParty.get url
pairs = response.parsed_response["pairs"]

liqui_pairs = []

# pull the pairs, populate to liqui_pairs
# if not hidden
pairs.each do |pair, data|
  set = pair.split("_")
  liqui_pairs.push set if data["hidden"] == 0
end

# liqui_pairs.each do |pair|
#   if target_tokens.include? pair[0]
#     p pair
#   end
# end

# pairs with ethereum as base pair
eth_base = liqui_pairs.select { |pair| pair[1].downcase == "eth" }

# tokens
eth_tokens = eth_base.map { |pair| pair[0] }

# payload is the tokens that are in
# liqui, and also in the target tokens array

liqui_avail = []

eth_tokens.each do |token|
  if target_tokens.include? token
    liqui_avail.push token
  end
end

liqui_avail.map! {|item| item.upcase}
p liqui_avail.sort!

puts "universe: #{coins.count}"
puts "tokens not on bittrex: #{target_tokens.count}"
puts "tokens not on bittrex, on liqui: #{liqui_avail.count}"

puts "*** on liqui ***"
p liqui_avail