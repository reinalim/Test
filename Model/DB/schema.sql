-- Creating tables for IPO-Stocks-DB

-- The ipo_listing_2019_2020 table
CREATE TABLE ipo_listing_2019_2020 (
	ipo_date DATE,
    symbol VARCHAR(40) NOT NULL,
	company_name VARCHAR(60),
	ipo_price NUMERIC,
	current_price NUMERIC,
	percent_return NUMERIC,
    PRIMARY KEY (symbol)
);

-- The company_overview table
CREATE TABLE company_overview (
    symbol VARCHAR(40) NOT NULL,
	asset_type VARCHAR(40),
	company_name VARCHAR(60),
	exchange VARCHAR(40),
	currency VARCHAR(40),
	country VARCHAR(40),
	sector VARCHAR(60),
	industry VARCHAR(60),
	address VARCHAR(90),
	FOREIGN KEY (symbol) REFERENCES ipo_listing_2019_2020 (symbol),
    PRIMARY KEY (symbol)
);

-- The three_month_return table
CREATE TABLE three_month_return (
	symbol VARCHAR(40) NOT NULL,
	ipo_date DATE,
	company_name VARCHAR(60),
	ipo_price NUMERIC,
	current_price NUMERIC,
	percentage_return NUMERIC,
	three_mth_date DATE,
	three_mth_ipo NUMERIC,
	price_change NUMERIC,
	three_mth_return NUMERIC,
	price_gain_loss VARCHAR(40),
    PRIMARY KEY (symbol),
	FOREIGN KEY (symbol) REFERENCES ipo_listing_2019_2020 (symbol)
);

-- The filtered_income_statement table
CREATE TABLE filtered_income_statement (
	symbol VARCHAR(40) NOT NULL,
	fiscaldate_end DATE,
	reported_currency VARCHAR,
	gross_profit NUMERIC,
	total_revenue NUMERIC,
	costof_revenue NUMERIC,
	costof_goodservices_sold NUMERIC,
	operating_income NUMERIC,
	selling_gen_admin NUMERIC,
	research_dev NUMERIC,
	operating_expenses NUMERIC,
	investment_income_net NUMERIC,
	net_interest_income NUMERIC,
	interest_income NUMERIC,
	interest_expense NUMERIC,
	noninterest_income NUMERIC,
	othernon_operatingincome NUMERIC,
	depreciation NUMERIC,
	dpr_and_amort NUMERIC,
	income_beforetax NUMERIC,
	incometax_expense NUMERIC,
	interest_debt_expense NUMERIC,
	netincome_cont_operations NUMERIC,
	comprehensive_income_netoftax NUMERIC,
	ebit NUMERIC,
	ebitda NUMERIC,
	netincome NUMERIC,
    PRIMARY KEY (symbol),
	FOREIGN KEY (symbol) REFERENCES ipo_listing_2019_2020 (symbol)
);

-- The filtered_balance_sheet table
CREATE TABLE filtered_balance_sheet (
	symbol VARCHAR(40) NOT NULL,
	fiscaldate_end DATE,
	reported_currency VARCHAR(40),
	total_assets NUMERIC,
	total_current_assets NUMERIC,
	cash_cashequivalent_carrvalue NUMERIC,
	cash_shortterm_investments NUMERIC,
	inventory NUMERIC,
	currentnet_receivables NUMERIC,
	total_noncurrent_assets NUMERIC,
	propertyplant_equip NUMERIC,
	acc_dpr_amort_ppe NUMERIC,
	intangible_assets NUMERIC,
	intangible_assets_exclgoodwill NUMERIC,
	goodwill NUMERIC,
	investments NUMERIC,
	longterm_investments NUMERIC,
	shortterm_investments NUMERIC,
	other_current_assets NUMERIC,
	other_noncurrrent_assets NUMERIC,
	total_liabilities NUMERIC,
	total_current_liabilities NUMERIC,
	current_acct_payable NUMERIC,
	deferred_revenue NUMERIC,
	current_debt NUMERIC,
	shortterm_debt NUMERIC,
	total_noncurrent_liabilities NUMERIC,
	capital_lease_obligations NUMERIC,
	longterm_debt NUMERIC,
	current_longterm_debt NUMERIC,
	longterm_debt_noncurrent NUMERIC,
	short_longterm_debt_total NUMERIC,
	other_current_liabilities NUMERIC,
	other_noncurrent_liabilities NUMERIC,
	total_shareholder_equity NUMERIC,
	treasury_stock NUMERIC,
	retained_earnings NUMERIC,
	common_stock NUMERIC,
	common_stockshares_outstanding NUMERIC,
    PRIMARY KEY (symbol),
	FOREIGN KEY (symbol) REFERENCES ipo_listing_2019_2020 (symbol)
);

-- The filtered_cash_flow table
CREATE TABLE filtered_cash_flow (
	symbol VARCHAR(40) NOT NULL,
	fiscaldate_end DATE,
	reported_currency VARCHAR(40),
	operating_cashflow NUMERIC,
	payments_foroperating_activities NUMERIC,
	proceeds_fromoperating_activities NUMERIC,
	changein_operating_liabilities NUMERIC,
	changein_operating_assets NUMERIC,
	dpr_depletion_amort NUMERIC,
	capital_expenditures NUMERIC,
	changein_receivables NUMERIC,
	changein_inventory NUMERIC,
	profit_loss NUMERIC,
	cashflow_frominvestment NUMERIC,
	cashflow_fromfinancing NUMERIC,
	proceeds_fromrepayment_shortterm_debt NUMERIC,
	payments_forrepurchase_commonstock NUMERIC,
	payments_forrepurchase_equity NUMERIC,
	payments_forrepurchase_preferredstock NUMERIC,
	div_payout NUMERIC,
	div_payout_commonstock NUMERIC,
	div_payout_preferredStock NUMERIC,
	proceeds_fromissuance_commonstock NUMERIC,
	proceeds_fromissuance_longterm_debtcapital_secnet NUMERIC,
	proceeds_fromissuance_preferredstock NUMERIC,
	proceeds_fromrepurchase_equity NUMERIC,
	proceeds_fromsale_treasurystock NUMERIC,
	changein_cash_cashequivalents NUMERIC,
	changein_exchangerate NUMERIC,
	netincome NUMERIC,
    PRIMARY KEY (symbol),
	FOREIGN KEY (symbol) REFERENCES ipo_listing_2019_2020 (symbol)
);

-- Loading CSV files into the table (method used as regular Import CSV in pgAdmin4 was giving failed exit code 1)
COPY Public."ipo_listing_2019_2020" FROM 'C:\Files\ipo_listing_2019_2020.csv' DELIMITER ',' CSV HEADER ;
COPY Public."company_overview" FROM 'C:\Files\company_overview.csv' DELIMITER ',' CSV HEADER ;
COPY Public."three_month_return" FROM 'C:\Files\three_month_return.csv' DELIMITER ',' CSV HEADER ;
COPY Public."filtered_income_statement" FROM 'C:\Files\filtered_income_statement.csv' DELIMITER ',' CSV HEADER ;
COPY Public."filtered_balance_sheet" FROM 'C:\Files\filtered_balance_sheet.csv' DELIMITER ',' CSV HEADER ;
COPY Public."filtered_cash_flow" FROM 'C:\Files\filtered_cash_flow.csv' DELIMITER ',' CSV HEADER ;