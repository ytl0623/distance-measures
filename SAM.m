function value = SAM( si, sj )
    sisj = sum( si .* sj ) ;
    siSqrt = sqrt( sum( si.^ 2 ) ) ;
    sjSqrt = sqrt( sum( sj.^ 2 ) ) ;
    value = acos( sisj / ( siSqrt * sjSqrt ) ) ;
end