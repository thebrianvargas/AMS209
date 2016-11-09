"""
Brian Vargas (bvargas6@ucsc.edu)
AMS209 Foundations of Scientific Computing
Homework #5 - Problem #2
lengthConvert.py
"""
def lengthConvert(measurement,unit):
    """
    Converts a length in a given unit system into other systems

    Inputs:
      * measurement   numerical measurement to be converted
      * unit          unit type inputted as a string
    Outputs:
      * out           list containing the conversions to the other main types
      * out2          list containing the conversions to the SI types

    Unit types allowed are meter, mile, inch, foot, yard
    SI types are nm, um, mm, cm, km
    """
    #initialize output variables as lists
    out = list()
    out2 = list()

    #dictionaries containing conversions for 1 meter
    unitDict = {"meter":1,"mile":0.000621,"inch":39.370079,"foot":3.28084,"yard":1.093613}
    siDict = {"nm":9,"um":6,"mm":3,"cm":2,"km":-3} #contains power of 10

    #if their unit spelling doesn't match mine, it's wrong!
    if unit not in unitDict:
        print "ERROR - invalid unit type"
        return
    #all measurements must be divided by it's value prior to conversion
    #that is, I convert to meter first then to another unit if needed
    baseMeasurement = measurement/unitDict[unit]

    #iterate through the keys in the dictionary - the unit types
    for unitType in unitDict.keys():
        #don't repeat the unit they gave us
        if unit == unitType:
            continue
        newMeasurement = baseMeasurement*unitDict[unitType]
        out.append(str(newMeasurement)+" "+unitType)

    for siType in siDict.keys():
        newMeasurement = baseMeasurement*10**siDict[siType]
        out2.append(str(newMeasurement)+" "+siType)

    #note that because we are iterating over the dictionary keys,
    #the order of placement in the list will be unpredictable
    #however, the promper doesn't tell us to order them any certain way
    print out
    print out2
    return

if __name__ == "__main__":
    measurement = input("Please input a length (number only): ")
    unit = raw_input("Please type a unit system (meter, mile, inch, foot, yard): ")
    lengthConvert(measurement,unit)


