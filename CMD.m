function value = CMD( K, si, sj )
    value = transpose( si - sj ) / K * ( si - sj ) ;
end