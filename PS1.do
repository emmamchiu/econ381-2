clear
set more off, permanently
cd "\\apporto.com\dfs\NTHW\Users\emc90_northwestern\Econ 381-2\Problem Set 1"
cap log close
log using PS1.log, replace

/***

Econ 381-2 Problem Set 1, Question 5
Emma Chiu
DUE 4/7/23

***/

/***
// a
use microfinance_baseline, clear

describe treatment hh_size head_age anyloan anyloan_amt total_biz total_exp_mo home_durable_index

asdoc ttest hh_size, by(treatment) replace save(t_tests.doc) title(T-tests for baseline variables)

foreach var of varlist head_age anyloan anyloan_amt total_biz total_exp_mo home_durable_index {
    asdoc ttest `var', by(treatment) rowappend
}

// b
use microfinance_endline, clear
est clear
eststo: reg spandana_amt_1 treatment, r
eststo: reg bizinvestment_1 treatment, r
eststo: reg wages_nonbiz_1 treatment, r

esttab using "regression_1.tex", replace booktabs 

// d
use microfinance_endline, clear
est clear
eststo: reg spandana_amt_1 treatment area_pop_base area_debt_total_base area_business_total_base area_exp_pc_mean_base area_literate_head_base area_literate_base, r
eststo: reg bizinvestment_1 treatment area_pop_base area_debt_total_base area_business_total_base area_exp_pc_mean_base area_literate_head_base area_literate_base, r
eststo: reg wages_nonbiz_1 treatment area_pop_base area_debt_total_base area_business_total_base area_exp_pc_mean_base area_literate_head_base area_literate_base, r

esttab using "regression_2.tex", replace booktabs

***/

// e
use microfinance_endline, clear
est clear
eststo: reg spandana_amt_1 treatment, vce(cluster areaid)
eststo: reg bizinvestment_1 treatment, vce(cluster areaid)
eststo: reg wages_nonbiz_1 treatment, vce(cluster areaid)

esttab using "regression_3.tex", replace booktabs 

est clear
eststo: reg spandana_amt_1 treatment area_pop_base area_debt_total_base area_business_total_base area_exp_pc_mean_base area_literate_head_base area_literate_base, vce(cluster areaid)
eststo: reg bizinvestment_1 treatment area_pop_base area_debt_total_base area_business_total_base area_exp_pc_mean_base area_literate_head_base area_literate_base, vce(cluster areaid)
eststo: reg wages_nonbiz_1 treatment area_pop_base area_debt_total_base area_business_total_base area_exp_pc_mean_base area_literate_head_base area_literate_base, vce(cluster areaid)

esttab using "regression_4.tex", replace booktabs

log close