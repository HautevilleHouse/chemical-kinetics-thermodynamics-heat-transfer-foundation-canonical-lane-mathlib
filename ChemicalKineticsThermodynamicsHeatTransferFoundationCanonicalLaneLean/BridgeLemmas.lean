import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ChemicalKineticsThermodynamicsHeatTransferWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse