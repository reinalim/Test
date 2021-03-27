-- Creating tables for IPO-Stocks-DB

-- The IPO_Listing_2019_2020 table
CREATE TABLE IPO_Listing_2019_2020 (
	ipo_date DATE,
    symbol VARCHAR(40) NOT NULL,
	company_name VARCHAR(60),
	ipo_price INT,
	current_price INT,
	percent_return INT,
    PRIMARY KEY (symbol),
    UNIQUE (company_name)
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
	FOREIGN KEY (symbol) REFERENCES IPO_Listing_2019_2020 (symbol),
    PRIMARY KEY (symbol),
    UNIQUE (company_name)
);

-- The three_month_return table
CREATE TABLE three_month_return (
	symbol VARCHAR(40) NOT NULL,
	ipo_date DATE,
	company_name VARCHAR(60),
	ipo_price INT,
	current_price INT,
	percent_return INT,
	three_mth_date DATE,
	three_mth_return INT,
    PRIMARY KEY (symbol),
	FOREIGN KEY (symbol) REFERENCES company_overview (symbol),
    UNIQUE (company_name)
);

-- The income_statement table
CREATE TABLE income_statement (
	symbol VARCHAR(40) NOT NULL,
	fiscaldate_end DATE,
	reported_currency VARCHAR,
	gross_profit INT,
	total_revenue INT,
	costof_revenue INT,
	costof_goodservices_sold INT,
	operating_income INT,
	selling_gen_admin INT,
	research_dev INT,
	operating_expenses INT,
	investment_income_net INT,
	net_interest_income INT,
	interest_income INT,
	interest_expense INT,
	noninterest_income INT,
	othernon_operatingincome INT,
	depreciation INT,
	dpr_and_amort INT,
	income_beforetax INT,
	incometax_expense INT,
	interest_debt_expense INT,
	netincome_cont_operations INT,
	comprehensive_income_netoftax INT,
	ebit INT,
	ebitda INT,
	netincome INT,
    PRIMARY KEY (symbol),
	FOREIGN KEY (symbol) REFERENCES IPO_Listing_2019_2020 (symbol)
);

-- The balance_sheet table
CREATE TABLE balance_sheet (
	symbol VARCHAR(40) NOT NULL,
	fiscaldate_end DATE,
	reported_currency INT,
	total_assets INT,
	total_current_assets INT,
	cash_cashequivalent_carrvalue INT,
	cash_shortterm_investments INT,
	inventory INT,
	currentnet_receivables INT,
	total_noncurrent_assets INT,
	propertyplant_equip INT,
	acc_dpr_amort_ppe INT,
	intangible_assets INT,
	intangible_assets_exclgoodwill INT,
	goodwill INT,
	investments INT,
	longterm_investments INT,
	shortterm_investments INT,
	other_current_assets INT,
	other_noncurrrent_assets INT,
	total_liabilities INT,
	total_current_liabilities INT,
	current_acct_payable INT,
	deferred_revenue INT,
	current_debt INT,
	shortterm_debt INT,
	total_noncurrent_liabilities INT,
	capital_lease_obligations INT,
	longterm_debt INT,
	current_longterm_debt INT,
	longterm_debt_noncurrent INT,
	short_longterm_debt_total INT,
	other_current_liabilities INT,
	other_noncurrent_liabilities INT,
	total_shareholder_equity INT,
	treasury_stock INT,
	retained_earnings INT,
	common_stock INT,
	common_stockshares_outstanding INT,
    PRIMARY KEY (symbol),
	FOREIGN KEY (symbol) REFERENCES income_statement (symbol)
);

-- The cash_flow table
CREATE TABLE cash_flow (
	symbol VARCHAR(40) NOT NULL,
	fiscaldate_end DATE,
	reported_currency INT,
	operating_cashflow INT,
	payments_foroperating_activities INT,
	proceeds_fromoperating_activities INT,
	changein_operating_liabilities INT,
	changein_operating_assets INT,
	dpr_depletion_amort INT,
	capital_expenditures INT,
	changein_receivables INT,
	changein_inventory INT,
	profit_loss INT,
	cashflow_frominvestment INT,
	cashflow_fromfinancing INT,
	proceeds_fromrepayment_shortterm_debt INT,
	payments_forrepurchase_commonstock INT,
	payments_forrepurchase_equity INT,
	payments_forrepurchase_preferredstock INT,
	div_payout INT,
	div_payout_commonstock INT,
	div_payout_preferredStock INT,
	proceeds_fromissuance_commonstock INT,
	proceeds_fromissuance_longterm_debtcapital_secnet INT,
	proceeds_fromissuance_preferredstock INT,
	proceeds_fromrepurchase_equity INT,
	proceeds_fromsale_treasurystock INT,
	changein_cash_cashequivalents INT,
	changein_exchangerate INT,
	netincome INT,
    PRIMARY KEY (symbol),
	FOREIGN KEY (symbol) REFERENCES IPO_Listing_2019_2020 (symbol)
);