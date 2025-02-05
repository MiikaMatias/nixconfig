p_HyValtsikka = 0.923
p_HyOikis     = 0.067
p_PaskaOikis  = 0.0
p_Valivuosi   = 0.4

U_HyValtsikka = 75
U_HyOikis     = 100
U_PaskaOikis  = 60
U_Valivuosi   = 10

E = (p_HyValtsikka * U_HyValtsikka +
     p_HyOikis     * U_HyOikis +
     p_PaskaOikis  * U_PaskaOikis +
     p_Valivuosi   * U_Valivuosi)

print(f"Odotusarvo on: {E}")