function value = OPD( si, sj )
    siT = transpose( si ) ;
    sjT = transpose( sj ) ;
    Msi = ( siT * si ) ^ -1 .* siT ;
    Msj = ( sjT * sj ) ^ -1 .* sjT ;
    Psi = eye( size( Msi, 2 ) ) - si * Msi ;
    Psj = eye( size( Msj, 2 ) ) - sj * Msj ;
    value = sqrt( siT * Psj * si + sjT * Psi * sj ) ;
end