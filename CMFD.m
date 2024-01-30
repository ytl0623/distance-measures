function value = CMFD( K, mu, si, sj )
    value = transpose( si - mu ) / K * ( sj - mu ) ;
end