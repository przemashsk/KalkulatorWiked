? IIF(
    PRODUKTTYP IN (611, 612),
(
        IIF(
            ZUPOS = 2,
            IIF(
                fn_getGrFarbClass3(ES6) = "KlaDrz2",
                PREISFELD22,
                PREISFELD21
            ),
            IIF(
                fn_getGrFarbClass3(ES6) = "KlaDrz2",
                PREISFELD12,
                PREISFELD11
            )
        ) * IIF(ARTNR = "WrzLis", 1, ES59)
    ),
    0
)