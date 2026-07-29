import ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean.ChemicalKineticsReactionModel

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ThermodynamicEquilibriumPackage where
  speciesSet : Type u
  gibbsFreeEnergy : Type v
  equilibriumConstant : Type w
  reactionQuotient : Prop
  vanTHoffRelation : Prop
  equilibriumCondition : Prop
  leChatelierPrinciple : Prop

structure ThermodynamicEquilibriumEvidence (T : ThermodynamicEquilibriumPackage) where
  reactionQuotientClosed : T.reactionQuotient
  vanTHoffRelationClosed : T.vanTHoffRelation
  equilibriumConditionClosed : T.equilibriumCondition
  leChatelierPrincipleClosed : T.leChatelierPrinciple

def ThermodynamicEquilibriumClosed (T : ThermodynamicEquilibriumPackage) : Prop :=
  T.reactionQuotient ∧ T.vanTHoffRelation ∧ T.equilibriumCondition ∧ T.leChatelierPrinciple

theorem thermodynamic_equilibrium_closed_from_evidence (T : ThermodynamicEquilibriumPackage) (E : ThermodynamicEquilibriumEvidence T) :
    ThermodynamicEquilibriumClosed T := by
  exact And.intro E.reactionQuotientClosed (And.intro E.vanTHoffRelationClosed (And.intro E.equilibriumConditionClosed E.leChatelierPrincipleClosed))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse