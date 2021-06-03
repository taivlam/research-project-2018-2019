# Initialize F4 - may be replaced with any other Coxeter group
G = CoxeterGroup(['F',4], implementation='reflection')
l = list(G.roots()) # List of all roots (in G)

# Define a conjugacy function in Coxeter group G
def IsConjugate(G, v1, v2):
    for g in G:
        if g * v1 == v2:
            return True
    return False

# Define function for forming conjugate classes in G
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

# Form the conjugacy classes from list of roots l in G
ConjClasses = MakeConjClasses(l, G)

d = {} # Initialize empty dictionary
# Create look-up dictionary (for speed)
for r in l:
    for c in ConjClasses:
        if r in c:
            d[tuple(r)] = c

def ObtainMatOfRHS(G, ConjClasses):  # Define function to obtain desired RHS's
    RedRootComb = Combinations(list(G.roots()), G.rank()).list() # This list will contain redun root comb's
    PreMatList = [] # Initialize empty list for preprocessed matrices
    for i in range(0, len(RedRootComb)):
        temp = matrix(RedRootComb[i]) # Creating a matrix out of rows
        PreMatList.append(temp) # Appending temp to PreMatList list
    def FormComplicatedMatrix(G, PreMatList):
        ComplicatedMatList = [] # Initialize empty list
        for m in PreMatList:
            TempVectList = [] # Initialize to store
            for c in ConjClasses:
                TempScalar = [] # Initialize empty list
                for i in range(0, m.nrows()):
                    if d[tuple(m.row(i))] == c: # If row is in conj class
                        TempScalar.append(1) # i-th entry is 1
                    else:
                        TempScalar.append(0) # i-th entry is 0
                TempVect = vector(G.base_ring(), TempScalar) # Form a vector from 0's & 1's
                TempVectList.append(TempVect) # Append TempVect on the RHS on deck
            for v in TempVectList: # for each v in TempVectList
                m = m.augment(v) # Augment v to  RHS of ea. matrix m in PreMatList
            ComplicatedMatList.append(m) # Add modified m to ComplicatedMatList
        return ComplicatedMatList
    ComplicatedMatList = FormComplicatedMatrix(G, PreMatList) # Form this
    RowReducedList = [] # Initialize empty list for next part
    for m in ComplicatedMatList:
        if m.rref().submatrix(0, 0, G.rank(), G.rank()) == identity_matrix(G.rank()): # If LHS part has full rank
            RowReducedList.append(m.rref()) # Then store the rref(m)
    StoredRHS = [] # Initialize empty list
    for m in RowReducedList:
        StoredRHS.append(m.submatrix(0, G.rank(), G.rank(), len(ConjClasses))) # Storing only the RHS's of each m in RowReducedList
    return StoredRHS

# Use function to obtain RHS's
StoredRHS = ObtainMatOfRHS(G, ConjClasses)

# Function to store only the 1st conj representatives of list l (in G)
def ConClassReps(l, G):
    result = []
    while len(l)>0:
        print "Found %d classes so far."%len(result) # Display messages to indicate progress
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

GoldElixir = ConClassReps(StoredRHS, G) # Return the conj class representatives
save(GoldElixir, "GoldElixirF4") # Saves the specified Sage object as "filename.sobj"