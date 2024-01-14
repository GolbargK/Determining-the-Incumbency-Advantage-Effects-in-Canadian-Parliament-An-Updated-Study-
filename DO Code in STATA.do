**generating time dummies
tab Parliament, gen(time)
**keeping only repeated parties
keep if RepeatParty==1
**creating an incumbency indicator
gen dummyMVPrev =1 if MVPrev >0
replace dummyMVPrev=0 if dummyMVPrev==.
**keeping only Liberals and Conservatives
keep if combinedparty=="Liberal" | combinedparty=="Conservative"
**creating dummy for Liberal and Conservative to be able to see overall and distinguished incumbency effect
gen Party1=1 if combinedparty=="Liberal"
replace Party1=0 if Party1==.
gen Party2=1 if combinedparty=="Conservative"
replace Party2=0 if Party2==.
tab ProvinceOrTerritory, gen(Prov)
**creating figure
gen MV100= MVPrev*100
rdplot declaredwinner MV100 if abs(MVPrev)<=0.15, p(1) h(15 15) nbins(25 25) graph_options(xtitle("margin of victory (%), time t-1") ytitle("probability of winning time t"))
**creating another figure for Jane to see probability of winning t-1
rdplot declaredwinner MV100 if abs(MVPrev)<=0.15, p(1) h(15 15) nbins(25 25) graph_options(xtitle("margin of victory (%), time t-1") ytitle("probability of winning time t-1"))
**Post and pre (dummies)
gen pre1950=1 if Parliament<=21
gen post1950=1 if Parliament >21 
**First column-combined:
**Linear
gen realmvprev2= MVPrev ^2
gen realmvprev3= MVPrev ^3
gen realmvprev4= MVPrev ^4
mean declaredwinner if (Party1 ==1 | Party2 ==1)
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if (Party1 ==1 | Party2 ==1) & MVPrev <=0.15 & MVPrev >=-0.15, cluster(Constituency)
outreg2 using results, word replace ctitle(model1) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if (Party1 ==1 | Party2 ==1) & MVPrev <=0.1 & MVPrev >=-0.1, cluster(Constituency)
outreg2 using results, word append ctitle(model2) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)
***Cubic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if (Party1 ==1 | Party2 ==1) & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results, word append ctitle(model3) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)
***Quartic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 realmvprev4 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 i.dummyMVPrev#c.realmvprev4 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if (Party1 ==1 | Party2 ==1) & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results, word append ctitle(model4) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)
***Second column
mean declaredwinner if Party1==1 & pre1950==1
***Linear
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & pre1950==1 & MVPrev <=0.15 & MVPrev >=-0.15, cluster(Constituency)
outreg2 using results, word append ctitle(model5) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & pre1950==1 & MVPrev <=0.1 & MVPrev >=-0.1, cluster(Constituency)
outreg2 using results, word append ctitle(model6) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)
***Cubic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & pre1950==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results, word append ctitle(model7) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Quartic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 realmvprev4 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 i.dummyMVPrev#c.realmvprev4 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & pre1950==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results, word append ctitle(model8) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Third column
mean declaredwinner if Party1==1 & post1950==1
***Linear
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & post1950==1 & MVPrev <=0.15 & MVPrev >=-0.15, cluster(Constituency)
outreg2 using results, word append ctitle(model9) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & post1950==1 & MVPrev <=0.1 & MVPrev >=-0.1, cluster(Constituency)
outreg2 using results, word append ctitle(model10) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Cubic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & post1950==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results, word append ctitle(model11) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Quartic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 realmvprev4 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 i.dummyMVPrev#c.realmvprev4 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & post1950==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results, word append ctitle(model12) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Fourth column
mean declaredwinner if Party2==1 & pre1950==1
***Linear
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & pre1950==1 & MVPrev <=0.15 & MVPrev >=-0.15, cluster(Constituency)
outreg2 using results, word append ctitle(model13) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & pre1950==1 & MVPrev <=0.1 & MVPrev >=-0.1, cluster(Constituency)
outreg2 using results, word append ctitle(model14) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Cubic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & pre1950==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results, word append ctitle(model15) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Quartic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 realmvprev4 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 i.dummyMVPrev#c.realmvprev4 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & pre1950==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results, word append ctitle(model16) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Fifth column
mean declaredwinner if Party2==1 & post1950==1
***Linear
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & post1950==1 & MVPrev <=0.15 & MVPrev >=-0.15, cluster(Constituency)
outreg2 using results, word append ctitle(model17) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & post1950==1 & MVPrev <=0.1 & MVPrev >=-0.1, cluster(Constituency)
outreg2 using results, word append ctitle(model18) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Cubic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & post1950==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results, word append ctitle(model19) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Quartic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 realmvprev4 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 i.dummyMVPrev#c.realmvprev4 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & post1950==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results, word append ctitle(model20) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)


**Post and pre (dummies)
gen pre2008=1 if Parliament<40
gen post2008=1 if Parliament >40 
***Second column
mean declaredwinner if Party1==1 & pre2008==1
***Linear
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & pre2008==1 & MVPrev <=0.15 & MVPrev >=-0.15, cluster(Constituency)
outreg2 using results2, word replace ctitle(model1) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & pre2008==1 & MVPrev <=0.1 & MVPrev >=-0.1, cluster(Constituency)
outreg2 using results2, word append ctitle(model2) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Cubic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & pre2008==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results2, word append ctitle(model3) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Quartic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 realmvprev4 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 i.dummyMVPrev#c.realmvprev4 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & pre2008==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results2, word append ctitle(model4) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Third column
mean declaredwinner if Party1==1 & post2008==1
***Linear
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & post2008==1 & MVPrev <=0.15 & MVPrev >=-0.15, cluster(Constituency)
outreg2 using results2, word append ctitle(model5) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & post2008==1 & MVPrev <=0.1 & MVPrev >=-0.1, cluster(Constituency)
outreg2 using results2, word append ctitle(model6) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Cubic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & post2008==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results2, word append ctitle(model7) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Quartic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 realmvprev4 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 i.dummyMVPrev#c.realmvprev4 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party1 ==1 & post2008==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results2, word append ctitle(model8) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Fourth column
mean declaredwinner if Party2==1 & pre2008==1
***Linear
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & pre2008==1 & MVPrev <=0.15 & MVPrev >=-0.15, cluster(Constituency)
outreg2 using results2, word append ctitle(model9) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & pre2008==1 & MVPrev <=0.1 & MVPrev >=-0.1, cluster(Constituency)
outreg2 using results2, word append ctitle(model10) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Cubic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & pre2008==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results2, word append ctitle(model11) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Quartic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 realmvprev4 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 i.dummyMVPrev#c.realmvprev4 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & pre2008==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results2, word append ctitle(model12) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Fifth column
mean declaredwinner if Party2==1 & post2008==1
***Linear
reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & post2008==1 & MVPrev <=0.15 & MVPrev >=-0.15, cluster(Constituency)
outreg2 using results2, word append ctitle(model13) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

reg declaredwinner dummyMVPrev MVPrev i.dummyMVPrev#c.MVPrev Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & post2008==1 & MVPrev <=0.1 & MVPrev >=-0.1, cluster(Constituency)
outreg2 using results2, word append ctitle(model14) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Cubic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & post2008==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results2, word append ctitle(model15) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)

***Quartic
reg declaredwinner dummyMVPrev MVPrev realmvprev2 realmvprev3 realmvprev4 i.dummyMVPrev#c.MVPrev i.dummyMVPrev#c.realmvprev2 i.dummyMVPrev#c.realmvprev3 i.dummyMVPrev#c.realmvprev4 Prov1 Prov2 Prov3 Prov4 Prov5 Prov6 Prov7 Prov8 Prov9 Prov10 Prov11 Prov12 Prov13 i.Parliament if Party2 ==1 & post2008==1 & MVPrev<=0.7 & MVPrev>=-0.7, cluster(Constituency)
outreg2 using results2, word append ctitle(model16) stat(coef se) alpha(0.01, 0.05,0.1) symbol(***, **, *) keep(dummyMVPrev)
