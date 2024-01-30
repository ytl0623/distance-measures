function value = SID( si, sj )
    siSum = sum( si ) ;
    sjSum = sum( sj ) ;
    pi = si ./ siSum ;
    pj = sj ./ sjSum ;
    pipj = pi ./ pj ;
    pjpi = pj ./ pi ;
    Di = -log( pipj ) ;
    Dj = -log( pjpi ) ;
    DDi = sum( pi .* Di ) ;
    DDj = sum( pj .* Dj ) ;
    value = DDi + DDj ;
end