import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ReactionKineticsPackage where
  species : Type u
  concentration : species -> ℝ
  rateConstant : species -> ℝ
  reactionRate : species -> Prop
  massActionLaw : Prop
  equilibriumConstant : Prop

structure ReactionKineticsEvidence (R : ReactionKineticsPackage) where
  rateConstantClosed : ∀ s, R.rateConstant s > 0
  massActionLawClosed : R.massActionLaw
  equilibriumConstantClosed : R.equilibriumConstant

def ReactionKineticsClosed (R : ReactionKineticsPackage) : Prop :=
  (∀ s, R.rateConstant s > 0) ∧ R.massActionLaw ∧ R.equilibriumConstant

theorem reaction_kinetics_closed_from_evidence (R : ReactionKineticsPackage)
    (E : ReactionKineticsEvidence R) : ReactionKineticsClosed R :=
  And.intro E.rateConstantClosed (And.intro E.massActionLawClosed E.equilibriumConstantClosed)

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse