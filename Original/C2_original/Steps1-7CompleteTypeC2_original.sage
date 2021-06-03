G = CoxeterGroup(['C',2], implementation='reflection')
l = list(G.roots())

def IsConjugate(G, v1, v2):
    for g in G:
        if g * v1 == v2:
            return True
    return False

def MakeConjClasses(l, G):
    classes = []
    for x in l:
        found = False
        for c in classes:
            if IsConjugate(G, x, c[0]):
                c.append(x)
                found = True
                break
        if not found:
            classes.append([x])
    return classes

ConjClasses = MakeConjClasses(l, G)

d = {}
for r in l:
    for c in ConjClasses:
        if r in c:
            d[tuple(r)] = c

def ObtainMatOfRHS(G, ConjClasses):
    RedRootComb = Combinations(list(G.roots()), G.rank()).list()
    PreMatList = []
    for i in range(0, len(RedRootComb)):
        temp = matrix(RedRootComb[i])
        PreMatList.append(temp)
    def FormComplicatedMatrix(G, PreMatList):
        ComplicatedMatList = []
        for m in PreMatList:
            TempVectList = []
            for c in ConjClasses:
                TempScalar = []
                for i in range(0, m.nrows()):
                    if d[tuple(m.row(i))] == c:
                        TempScalar.append(1)
                    else:
                        TempScalar.append(0)
                TempVect = vector(G.base_ring(), TempScalar)
                TempVectList.append(TempVect)
            for v in TempVectList:
                m = m.augment(v)
            ComplicatedMatList.append(m)
        return ComplicatedMatList
    ComplicatedMatList = FormComplicatedMatrix(G, PreMatList)
    RowReducedList = []
    for m in ComplicatedMatList:
        if m.rref().submatrix(0, 0, G.rank(), G.rank()) == identity_matrix(G.rank()):
            RowReducedList.append(m.rref())
    StoredRHS = []
    for m in RowReducedList:
        StoredRHS.append(m.submatrix(0, G.rank(), G.rank(), len(ConjClasses)))
    return StoredRHS

StoredRHS = ObtainMatOfRHS(G, ConjClasses)

def ConClassReps(l, G):
    result = []
    while len(l)>0:
        print "Found %d classes so far."%len(result)
        print "%d elements left to classify."%len(l)
        print
        result.append(l[0])
        i = 0
        for g in G:
            print i, len(l)
            i += 1
            the_conjugate = g * result[-1]
            newlist = [x for x in l if x != the_conjugate]
            l = newlist
    return result

GoldElixir = ConClassReps(StoredRHS, G)
save(GoldElixir, "GoldElixirC2_original") # Saves the specified Sage object as "filename.sobj"
