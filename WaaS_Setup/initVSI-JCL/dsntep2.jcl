//IBMUSERD  JOB ACCT#,MSGCLASS=H,MSGLEVEL=(1,1)
//*
//*---------------------------------------------------
//* NJL 
//*   - build dsntep2  - run once 
//*   - Source = DB2V13.SDSNSAMP(DSNTEJ1L) 
//*
//JOBLIB  DD DISP=SHR,DSN=DB2V13.SDSNLOAD
//        DD DISP=SHR,DSN=CEE.SCEERUN
//*        STEP 1 : CREATE DSNTEP2 LOADMOD FROM DSNTEP2L OBJECT DECK
//PH01LS01 EXEC PGM=IEWL,PARM='XREF'
//SYSLIB   DD DISP=SHR,DSN=CEE.SCEELKED
//         DD DISP=SHR,DSN=DB2V13.SDSNLOAD
//SDSNSAMP DD DISP=SHR,DSN=DB2V13.SDSNSAMP(DSNTEP2L)
//SYSLMOD  DD DISP=SHR,DSN=DBD1.RUNLIB.LOAD(DSNTEP2)
//SYSPRINT DD SYSOUT=*
//SYSUT1   DD UNIT=SYSDA,SPACE=(1024,(50,50))
//SYSLIN   DD *
     INCLUDE SDSNSAMP(DSNTEP2L)
     INCLUDE SYSLIB(DSNELI)
     NAME DSNTEP2(R)
//*        STEP 2 : BIND AND RUN PROGRAM DSNTEP2, TO
//PH01LS02 EXEC PGM=IKJEFT01,DYNAMNBR=20,COND=(4,LT)
//DBRMLIB  DD DISP=SHR,DSN=DB2V13.SDSNSAMP
//SYSTSPRT DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SYSTSIN  DD *
 DSN SYSTEM(DBD1)
 BIND PACKAGE (DSNTEP2) MEMBER(DSN@EP2L) APPLCOMPAT(V13R1M501) +
      CURRENTDATA(NO) ACT(REP) ISO(CS) ENCODING(EBCDIC)
 BIND PLAN(DSNTEP22)  PKLIST(DSNTEP2.*) +
      ACTION(REPLACE) RETAIN +
      CURRENTDATA(NO) ISO(CS) ENCODING(EBCDIC) SQLRULES(DB2)
/*