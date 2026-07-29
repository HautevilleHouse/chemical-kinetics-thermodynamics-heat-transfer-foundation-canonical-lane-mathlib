import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ReactionKineticsPackage where
  species : Type u
  reactions : Type v
  rateConstants : Type w
  massActionLaw : Prop
  equilibriumConstant : Prop
  activationEnergy : Prop
  rateDeterminingStep : Prop

structure ReactionKineticsEvidence (K : ReactionKineticsPackage) where
  massActionLawClosed : K.massActionLaw
  equilibriumConstantClosed : K.equilibriumConstant
  activationEnergyClosed : K.activationEnergy
  rateDeterminingStepClosed : K.rateDeterminingStep

def ReactionKineticsClosed (K : ReactionKineticsPackage) : Prop :=
  K.massActionLaw ∧ K.equilibriumConstant ∧ K.activationEnergy ∧ K.rateDeterminingStep

theorem reaction_kinetics_closed_from_evidence (K : ReactionKineticsPackage) (E : ReactionKineticsEvidence K) :
    ReactionKineticsClosed K := by
  exact And.intro E.massActionLawClosed (And.intro E.equilibriumConstantClosed (And.intro E.activationEnergyClosed E.rateDeterminingStepClosed))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse