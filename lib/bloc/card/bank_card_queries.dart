const getAllBankCardsQuery ="""
query {
  accountListing(customerId:"9LNB1478945360957261"){
    ledgerBalance
    availableBalance
    bankAccountType
    currency
    accountName
    accountNumber
  
    
}
}
""";