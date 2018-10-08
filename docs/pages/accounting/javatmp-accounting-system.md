---
title: JavaTMP Accounting System
---
# JavaTMP Accounting System

In business, each profit making company establishes an accounting system to manage and keep track of its
assets, liabilities, equities, revenues, and expenses.
The accounting system also provides the basis for the financial reports the company must file periodically.

The basic building block in the system is the account, which is the name for a place or holder for recording values and value changes
(additions and subtractions) for one specific purpose. In fact, "specific purposes" are divided into five categories,
and these categories represent the five—the only five—kinds of accounts possible in an accounting system.
Note that the five account categories fall into two groups:
- Firstly, the Balance sheet accounts, and
- Secondly, the Income statement accounts.

Three Balance Sheet Account Categories
1. `Asset accounts`: Items of value that are owned and used by the firm for generating earnings
in its primary line of business. For example:
    "Cash on Hand"
    "Accounts Receivable"
2. `Liability accounts`: Debts the business owes. For instance:
    "Accounts Payable"
    "Salaries Payable"
3. `Equity accounts`: Owner claims (Shareholder claims) to business assets. For example:
    "Owner Capital"
    "Retained Earnings"

Two Income Statement Account Categories
1. `Revenue accounts`: Incoming revenues, primarily from the sale of goods and services.
    For instance:
    "Product Sales Revenues"
    "Interest Earned Revenues"
2. `Expense accounts`: Expenses incurred in the course of business. For example:
    "Direct Labor Expenses"
    "Advertising Expenses"

### Every Transaction Impacts Two Accounts
In reality, even a small business may identify a hundred or more such accounts for its accounting system,
while a large company may use many thousands. Nevertheless, for bookkeeping and accounting purposes,
all named accounts fall into one of the five categories above.
For firms that use double-entry systems, every financial transaction causes two equal, and offsetting account changes,
the change in one account called a debit (DR), and the entry in another is called a credit (CR).

Debits and Credits Impact Differently in Different Account Categories
the bookkeeper and accountant handle each transaction for an account depends on which of the five account categories includes it.
Whether a debit or a credit increases or decreases the account balance depends on the account's type:

| Account Type | Debit (DR) Entry | Credit (CR) Entry |
|--------------|------------------|-------------------|
|Asset account | Increases (adds to) account balance | Decreases (subtracts from) account balance |
|Liability account | Decreases (subtracts from) account balance | Increases (adds to) account balance |
|Equity account | Decreases (subtracts from) account balance | Increases (adds to) account balance |
|Revenue account | Decreases (subtracts from) account balance | Increases (adds to) account balance |
|Expense account | Increases (adds to) account balance | Decreases (subtracts from) account balance |

In this way, the basic accounting equation always holds, and the Balance sheet stays balanced:
    `Assets = Liabilities + Equities`
And, for every pair of account entries that follow from a single transaction:
    `Debits = Credits`
Which yield for the sum of all debit entries in the account ledgers for the accounting period must equal
the sum of all credit entries.
    `Total Debits = Total Credits`

### Chart of Accounts
This example shows the structure and general approach:
Chart of Accounts
- Asset Accounts - Current Assets
100 | Petty cash
101 | Cash on hand
103 | Regular checking account
105 | Payroll checking account
110 | Accounts receivable
120 | Allowance for doubtful accounts
130 | Work in progress inventory
139 | Finished goods inventory
140 | Prepaid expenses
150 | Employee advances
- Asset Accounts - Fixed Assets
160 | Furniture and fixtures
162 | Vehicles
163 | Factory manufacturing equipment
165 | Buildings
169 | Land
170 | Accumulated depreciation, furniture, fixtures
172 | Accumulated depreciation, vehicles
175 | Accumulated depreciation, factory mfr equip.
179 | Accumulated depreciation, buildings
- Asset Accounts - Other Assets
190 | Accumulated amortization
194 | Notes receivable, non-current
- Liability Accounts - Current Liabilities
200 | Accounts payable
234 | Payroll payable
235 | Accrued fees
240 | Accrued interest
- Liability Accounts - Long-Term Liabilities
260 | Bonds payable
270 | Discount on bonds payable
280 | Bank loans payable
290 | Equipment payable
- Equity Accounts
320 | Owner capital
350 | Retained earnings
380 | Dividends
- Revenue Accounts
410 | Product sales revenues
420 | Services sales
430 | Rental property revenues
450 | Interest earned revenues
- Expense Accounts - Cost of Goods Sold
520 | Raw materials costs
530 | Direct labor costs
540 | Indirect labor costs
550 | Manufacturing plant costs
- Expense Accounts - Other
601 | Supplies Expense
630 | Bad debt Expense
650 | Advertising Expense
720 | Salary and Wage Expense
735 | Travel Expenses
750 | Equipment Lease Expense
760 | Depreciation Expense,Vehicles
770 | Depreciation Expense, Factory mfr Equipment
800 | Other expenses

### Main Accounting System User Interface Pages
The following list provides an initial pages list of JavaTMP Accounting System Project Version:
Main Pages:
- Home (Page)
- Accounting (Sub Menu Item)
    - chart of accounts (Page)
    - General Ledger (Page)
    - Create Transaction (Journal Entry) (A group of entries) (Page)
- Reports (Sub Menu Item)
    - Trial Balance (Page)
    - Profit and Loss (Income) Statement (Page)
- System (Sub Menu Item)
    - User Profile (Page)
        - Update Basic Information
        - Select and switch themes
        - Switch Interface language
    - Activities And Notifications (Page)
    - Main Login Page (Page)
    - Main 404 error (Page)

What is the difference between Journal Entry and Journal Voucher?
http://www.erpgreat.com/financial/journal-entry-vs-journal-voucher.htm
General Ledger
https://www.business-case-analysis.com/ledger.html

main quickbooks account types
https://community.intuit.com/articles/1146110-how-accounts-are-affected-by-debits-and-credits
Standard Quickbooks export/import file
http://qblittlesquare.com/2011/07/import-lists-into-quickbooks-with-iif/

https://fitsmallbusiness.com/set-up-chart-of-accounts-quickbooks-online/
https://community.intuit.com/articles/1146110-how-accounts-are-affected-by-debits-and-credits

Double-entry accounting design
https://dba.stackexchange.com/questions/102370/double-entry-bookkeeping-database-design
https://dba.stackexchange.com/questions/17197/what-is-a-common-way-to-save-debit-and-credit-information

### Main Entities involve in the module are:
- Root Account Type: Asset, Liability, Income, Expense, Capital (Owner's Equity)
- Account Category Type: (Higher business level naming and categorized types of the above root type)
    - You can simply Categorized Accounts based on their root type like the following:
    Assets Accounts, Liability Accounts, Income Accounts, Expense Accounts, Equity Accounts.
    - You could use more sophisticated naming like the above:
    Current Assets, Fixed Assets, Other Assets, Current Liabilities, Long-Term Liabilities, Equity Accounts,
    Revenue Accounts, Cost of Goods Sold, Other Expense Accounts
    - You could use another naming derived from your module and business needs, like the following:
    Checking or savings bank Account, Accounts receivable, Other current asset, Fixed asset, Accounts payable,
    Credit card account, Income, Cost of goods sold.
    - You could use your local official authority types based in your industry and company type.
- Account (Chart Of Accounts)
    - A chart of accounts (COA) provides a complete listing of every account in an accounting system.
    An account is a unique record for each type of asset, liability, equity, revenue and expense.
    It lists the names of the accounts that a company has identified and made available for recording transactions in its general ledger,
    establishes the level of detail tracked in a record-keeping system. Typically, a COA contains the accounts’ names, brief descriptions
    and identification codes and usually shown in A tree or hierarchy level style.
    - A well-designed COA not only meets the information needs of management, it also helps a business to comply
    with financial reporting standards. A company has the flexibility to tailor its chart of accounts to best suit its needs
- Account_Transaction (General Ledger)
    - Each entry in the general ledger must appear in two places: once as a debit and once as a corresponding credit.
    And the two added together must equal zero.
    - GL entries or records is grouped by transaction record or Journal Entry.
- Transaction (Journal Entry)
    - Business activity applied by one or more modules in the system to update or change accounts balances.
    - Transaction has at least two records in account_transaction.
    - The journal entry can consist of several recordings in Account_transaction or GL , each of which is either a debit or a credit.
    The total of the debits must equal the total of the credits or the journal entry is said to be "unbalanced".
    - In manual accounting or bookkeeping systems, business transactions are first recorded in a journal, hence the term journal entry.
    A manual journal entry that is recorded in a company's general journal will consist of the following:
        - the appropriate date,
        - the amount(s) and account(s) that will be debited
        - the amount(s) and account(s) that will be credited
        - a short description/memo
        - a reference such as a check number

    These journalized amounts (which will appear in the journal in order by date) are then posted to the accounts in the general ledger.
    Today, computerized accounting systems will automatically record most of the business transactions into
    the general ledger accounts immediately after the software prepares the sales invoices, issues checks to creditors,
    processes receipts from customers, etc. The result is we will not see journal entries for most of the business transactions.
- Transaction Type
    - It classifies the transaction (ex, acquisition, retirement, transfer, purchase,
    expense, payment, borrowing, sale closing, revenue received, and soon on),
    and determines how the transaction is processed in the system's modules.
- Module
- Transaction_module


