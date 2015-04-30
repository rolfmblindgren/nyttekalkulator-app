pow <- function (x,y) return (x ^ y)

ns <- function (n) {

    if (n < 0.05) {

        return (2.057760072 - 6.80979622299999932 * n
        +  243.91848899999999 * pow(n - 0.05, 3));                          

    } else if ( n < 0.10 ) {

        return (2.248 -4.980 * n
        + 36.588 * pow (n-0.1,2)
        - 259.592 * pow (n-0.1,3));

    } else if ( n <= 0.15 ) {

        return (2.051  - 3.269 * n
                - 2.351 * pow (n - 0.15,2)
                + 74 * pow (n-0.15,3));

    } else if ( n <= 0.20 ) {

        return (1.989 - 2.945 * n
                + 8.817 * pow (n - 0.2,2)
                - 38.213 * pow (n-0.2,3));

    } else if ( n <= 0.25 ) {

        return (1.858 - 2.350 * n
                + 3.085 * pow ( n - 0.25,2)
                - 1.600 * pow (n-0.25,3));

    } else if ( n<= 0.30 ) {

        return (1.776 - 2.054 * n
                + 2.844 * pow (n - 0.3,2)
                - 35.386 * pow (n - 0.3,3));

    } else if ( n <= 0.35 ) {

        return (1.772 - 2.035 * n
                - 2.463 * pow (n - 0.35,2)
                + 63.143 * pow (n - 0.35,3));

    } else if ( n <= 0.40 ) {

        return (1.683 - 1.807 * n
                + 7.008 * pow (n - 0.4,2)
                - 57.186 * pow (n - 0.4,3));

    } else if ( n <= 0.45 ) {

        return (0.88);

    } else if ( n <= 0.50 ) {

        return (0.80);
        
    } else if ( n <= 0.55 ) {

        return (0.72);

    } else if ( n <= 0.60 ) {

        return (0.65);

    } else if ( n <= 0.65 ) {

        return (0.57);

    } else if ( n <= 0.70 ) {

        return (0.50);
        
    } else if ( n <= 0.75 ) {

        return (0.43);

    } else if ( n <= 0.80 ) {

        return (0.35);

    } else if ( n <= 0.85 ) {

        return (0.27);

    } else if ( n <= 0.90 ) {

        return (0.20);

    } else if ( n <= 0.95 ) {

        return (0.11);

    } else {

        return (0);
 }

}
