---
title: JavaTMP Accounting System
---
# JavaTMP Accounting System
In business, each profit or non-profit company establishes an accounting system to manage and keep track of its
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
    - 100 - Petty cash
    - 101 - Cash on hand
    - 110 - Accounts receivable
- Asset Accounts - Fixed Assets
    - 160 - Furniture and fixtures
    - 162 - Vehicles
    - 163 - Factory manufacturing equipment
    - 165 - Buildings
    - 169 - Land
    - 170 - Accumulated depreciation, furniture, fixtures
- Asset Accounts - Other Assets
    - 190 - Accumulated amortization
    - 194 - Notes receivable, non-current
- Lability Accounts - Current Liabilities
    - 200 - Accounts payable
    - 234 - Payroll payable
- Liability Accounts - Long-Term Liabilities
    - 260 - Bonds payable
    - 280 - Bank loans payable
- Equity Accounts
    - 320 - Owner capital
    - 350 - Retained earnings
    - 380 - Dividends
- Revenue Accounts
    - 410 - Product sales revenues
    - 420 - Services sales
- Expense Accounts - Cost of Goods Sold
    - 520 - Raw materials costs
    - 530 - Direct labor costs
- Expense Accounts - Other
    - 650 - Advertising Expense
    - 720 - Salary and Wage Expense
    - 760 - Depreciation Expense
    - 800 - Other expenses

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
    expense, payment, borrowing, sale closing, revenue received, Refund, and soon on),
    and determines how the transaction is processed in the system's modules.
    - QuickBooks uses the following types to identify transaction:
    Cheque, Sales Receipt, Deposit, Invoice, Estimate, Transfer, Bill, Credit Card Charge, Payment, Credit Note,
    Sales Order, General Journal, Bill Pmt -Cheque, Bill Pmt -CCard, Payroll Payment, Liability Cheque.
    - Transaction types are usually related to specific module or subsystem
    and each one of module has a set of valid type to use.
- Modules or Systems
    - Accounting System. Accounting software records and processes accounting transactions within functional modules such as accounts payable,
        accounts receivable and payroll. Together, these modules function as an accounting information system. The main modules of
        Accounting System are:
        - General Ledger Module. A General Ledger is the central repository of the accounting records and data.
        Common functionality of the General Ledger module:
            - The general ledger is the central point for accounting information, receiving entries from other modules,
            such as accounts payable, accounts receivable and payroll modules.
            - The general ledger is the basis for creating key financial documents, including trial balance,
            balance sheet and profit and loss statement.
            - The general ledger is used to record financial transactions not recorded in other modules.
            - The general ledger creates a trail of information used for audit purposes.
        - Chart of Accounts Module. A chart of accounts is a list of the accounts used by a business in the accounting process.
        Common functionality of the Chart of Accounts module:
            - The chart of accounts uses a series of codes to identify assets, income, expenses,
            and equity being tracked by the system by the accounting system.
            - The chart of accounts determines the level of detail of the information tracked
            and the reports generated by the accounting system.
            - The chart of accounts can use sub-coding at the department, location, project, funding source, division,
            work order or activity level to gather more detailed information if required.
        - Trial Balance Module. The trial balance is a listing of all accounts in the company’s chart of accounts
        that list the balances in each of these accounts at a particular point in time.
        Common functionality of the Trial Balance module:
            - The trial balance will have the balance for each account in the chart of accounts.
            - The trial balance is used to create all other financial statements,
            including the balance sheet, income statement and cash flow statement.
        - Balance Sheet Module. A balance sheet is often described as a "snapshot of a company's financial condition”.
        Common functionality of the Balance Sheet module:
            - The balance sheet lists the company’s assets, liabilities, and equity.
            - The balance sheet is used to create reports on cash flow, budgets
            and conduct other financial analysis of the business’s financial condition.
        - Accounts Receivable Module. Accounts receivable are the money owed by customers to the business.
        Common functionality of the Accounts Receivable module:
            - The accounts receivable module handles the invoicing of customers and processing of customer payments.
            - The accounts receivable module is often used to create bills or invoices to send to customers.
            - The accounts receivable module often has the ability to recognize deposits to bank accounts
            so that deposit information can be upload and applied to customer accounts automatically.
            - The master files contain customer information, including name, address and phone number.
            - The accounts receivable aging report will show all money due to the business by ​the customer
            and will be able to show how long the customer’s balance has been outstanding.
        - Accounts Payable Module. Accounts payable are the money owed by a business to its vendors.
        Common functionality of the Accounts Payable module:
            - The Accounts Payable module tracks money due to vendors, discounts, and payment terms for all invoices.
            - This module has the ability to print computer-generated checks to vendors.
            - The accounts payable master files contain vendor information, including name, address and phone number.
        - Point of Sale Module. The point of sale is the place where a sales transaction takes place,
        which can be at a retail store, online, or in any other venue.
        Common functionality of the Accounts Payable module:
            - The Accounts Payable modules tracks money due to vendors, discounts and payment terms for all invoices.
            - This module has the ability to print computer-generated checks to vendors.
            - The accounts payable master files contain vendor information, including name, address and phone number.
        - Invoice
            - An invoice, bill or tab is a commercial document issued by a seller to a buyer, relating to a sale transaction
            and indicating the products, quantities, and agreed prices for products or services the seller had provided the buyer.
            - Payment terms are usually stated on the invoice. These may specify that the buyer has a maximum number of days
            in which to pay and is sometimes offered a discount if paid before the due date.
            The buyer could have already paid for the products or services listed on the invoice.
            - From the point of view of a seller, an invoice is a sales invoice.
            From the point of view of a buyer, an invoice is a purchase invoice.
            The document indicates the buyer and seller, but the term invoice indicates money is owed or owing.
            - Invoices are different from receipts. Both invoices and receipts are ways of tracking purchases of goods and services.
            But Invoices differ from receipts in that invoices serve to notify customers of payments owed,
            whereas receipts serve as proof of completed payment.
            - A typical invoice may contain:
                The word invoice (or tax invoice);
                A unique reference number (in case of correspondence about the invoice);
                Date of the invoice;
                Credit terms;
                Tax payments, if relevant (e.g., GST or VAT);
                Name and contact details of the seller;
                Tax or company registration details of seller, if relevant e.g. VAT number for businesses;
                Name and contact details of the buyer;
                Date that the goods or service was sent or delivered;
                Purchase order number (or similar tracking numbers requested by the buyer to be mentioned on the invoice);
                Description of the product(s);
                Unit price(s) of the product(s), if relevant;
                Total amount charged (optionally with breakdown of taxes, if relevant);
                Payment terms (including method of payment, date of payment, and details about charges for late payment);
        - Inventory Or Stock.
            - Inventory (American English) or stock (British English) is the goods and materials that a business holds
            for the ultimate goal of resale (or repair).
            - The concept of inventory, stock or work-in-process has been extended from manufacturing systems
            to service businesses and projects, by generalizing the definition to be
            "all work within the process of production- all work that is or has occurred prior to the completion of production."
            In the context of a manufacturing production system, inventory refers to all work that has occurred –
            raw materials, partially finished products, finished products prior to sale and departure from the manufacturing system.
            In the context of services, inventory refers to all work done prior to sale, including partially process information.
            - Inventory appears as a current asset on an organization's balance sheet because the organization can,
            in principle, turn it into cash by selling it.
        - Purchase order (PO).
            - A purchase order (PO) is a commercial document and first official offer issued by a buyer to a seller,
            indicating types, quantities, and agreed prices for products or services.
            It is used to control the purchasing of products and services from external suppliers.
            Purchase orders can be an essential part of ERP system orders.
            - The issue of a purchase order does not itself form a contract.
            If no prior contract exists, then it is the acceptance of the order by the seller that forms
            a contract between the buyer and seller.
            - Purchase orders allow buyers to clearly and explicitly communicate their intentions to sellers.
            They may also help a purchasing agent to manage incoming orders and pending orders.
            Sellers are also protected by POs in case of a buyer's refusal to pay for goods or services.
            - Creating a purchase order is typically the first step of the purchase to pay process in an ERP system.
            Purchase orders may require a SKU code.
        - Sales order.
            - The sales order, sometimes abbreviated as SO, is an order issued by a business or sole trader to a customer.
            A sales order may be for products and/or services.
            - A sales order is an internal document of the company, meaning it is generated by the company itself.
            A sales order should record the customer's originating purchase order which is an external document.
            - The customer's PO is the originating document which triggers the creation of the sales order.
            A sales order, being an internal document, can therefore contain many customer purchase orders under it.
            In a manufacturing environment, a sales order can be converted into a work order to show
            that work is about to begin to manufacture, build or engineer the products the customer wants.
            - Common types of sales order are sales quote, invoices, estimates.
        - Bookkeeping.
            - Bookkeeping is the recording of financial transactions, and is part of the process of accounting in business.
            Transactions include purchases, sales, receipts, and payments by an individual person or an organization/corporation.
            There are several standard methods of bookkeeping, such as the single-entry bookkeeping system and
            the double-entry bookkeeping system
            - Any process that involves the recording of financial transactions is a bookkeeping process.
- Transaction_module
    - each transaction is created based on some activities initiated from modules
    and for more flexibilities we suppose that transaction may involved in more than one module at the time.
    - This entity will track the relation between one transaction and corresponding modules involved in it.

### References:
- [Core Modules And Features In Accounting Software Programs](https://www.thebalancesmb.com/core-modules-and-features-in-accounting-software-programs-14234)
- [Data Models For Accounting Systems](http://www.databaseanswers.org/data_models/accounting_systems/index.htm)
- [Accounting Software Wikipedia Page](https://en.wikipedia.org/wiki/Accounting_software)
- [Accounting Study Guide](http://accountinginfo.com/study/accounting-01.htm)
- [Journal Entries](https://www.myaccountingcourse.com/accounting-cycle/journal-entries)
- [General Ledger](https://www.business-case-analysis.com/ledger.html)
- [What is the difference between Journal Entry and Journal Voucher?](http://www.erpgreat.com/financial/journal-entry-vs-journal-voucher.htm)
- [main quickbooks account types](https://community.intuit.com/articles/1146110-how-accounts-are-affected-by-debits-and-credits)
- [Standard Quickbooks export/import IIF file format](http://qblittlesquare.com/2011/07/import-lists-into-quickbooks-with-iif/)
- [How to Set Up the Chart of Accounts in QuickBooks Online](https://fitsmallbusiness.com/set-up-chart-of-accounts-quickbooks-online/)
- [How accounts are affected by debits and credits](https://community.intuit.com/articles/1146110-how-accounts-are-affected-by-debits-and-credits)
- [Double entry bookkeeping database design](https://dba.stackexchange.com/questions/102370/double-entry-bookkeeping-database-design)
- [What is a common way to save 'debit' and 'credit' information?](https://dba.stackexchange.com/questions/17197/what-is-a-common-way-to-save-debit-and-credit-information)
- [Accounting Basics](https://actionstep.atlassian.net/wiki/spaces/KB/pages/5406942/Accounting+Basics)