import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ChemicalKineticsThermodynamicsHeatTransferAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  reactionRates : Prop
  thermodynamicConsistency : Prop
  heatTransferModel : Prop
  conclusion : reactionRates ∧ thermodynamicConsistency ∧ heatTransferModel

def ChemicalKineticsThermodynamicsHeatTransferWitnessClosed (O : ChemicalKineticsThermodynamicsHeatTransferAdmittedObject) : Prop :=
  O.reactionRates ∧ O.thermodynamicConsistency ∧ O.heatTransferModel

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse