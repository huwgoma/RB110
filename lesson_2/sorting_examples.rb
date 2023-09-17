puts ['arc', 'bat', 'cape', 'ants', 'cap'].sort 
# Compare arc and bat. arc <=> bat will return -1 (a is less than c)
#   Do not swap => [arc, bat, cape, ants, cap]
# Compare bat and cape. bat <=> cape will return -1 (b is less than c.)
#   Do not swap => [arc bat cape ants cap] 
# Compare cape and ants. cape <=> ants returns 1 (c is greater than a).
#   Swap => [arc bat ants cape cap]
# Compare bat and ants. bat <=> ants returns 1 (b is greater than a.)
#   Swap => [arc ants bat cape cap]
# Compare arc and ants. arc <=> ants returns 1 (a == a; r > n) 
#   Swap => [ants arc bat cape cap]
# Compare cape and cap. cape <=> cap returns 1 (c == c; a == a; p == p; cape is longer)
#   Swap => [ants arc bat cap cape]
# => ['ants', 'arc', 'bat', 'cap', 'cape']

[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# Compare [a, cat, b, c] to [b, 2]. Compare a[0] <=> b[0] => -1 (a < b).
#   => Do not swap. [[a, cat, b, c], [b, 2], [a, car, d, 3], [a, car, d]]
# Compare [b, 2] to [a, car, d, 3]. Compare a[0] <=> b[0] => 1 (b > a).
#   => Swap. [[a, cat, b, c], [a, car, d, 3], [b, 2], [a, car, d]]
# Compare [a, cat, b, c] to [a, car, d, 3]. 
#   Compare a[0] <=> b[0] => 0 (a == a)
#   Compare a[1] <=> b[1] => 1 (cat > car)
#   => Swap [[a, car, d, 3], [a, cat, b, c], [b, 2], [a, car, d]]

# Compare [b, 2] to [a, car, d]. Compare a[0] <=> b[0] => 1 (b > a)
#   => Swap [[a, car, d, 3], [a, cat, b, c], [a, car, d], [b, 2]]

# Compare [a, cat, b, c] <=> [a, car, d]. 
#   Compare a[0] <=> b[0] => 0 (a == a)
#   Compare a[1] <=> b[1] => 1 (cat > car)
#   => Swap [[a, car, d, 3], [a, car, d], [a, cat, b, c], [b, 2]]

# Compare [a, car, d, 3] <=> [a, car, d]. 
#   Compare a[0] <=> b[0] => 0 (a == a)
#   Compare a[1] <=> b[1] => 0 (car == car)
#   Compare a[2] <=> b[2] => 0 (d == d)
#   Compare a.size <=> b.size => 1 (4 > 3)
#   => Swap [[a, car, d], [a, car, d, 3], [a, cat, b, c], [b, 2]]