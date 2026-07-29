import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure EquilibriumConstantPackage where
  reactionQuotient : Prop
  equilibriumConstant : Prop
  vanTHoffEquation : Prop
  temperatureDependence : Prop
  standardState : Prop

structure EquilibriumConstantEvidence (E : EquilibriumConstantPackage) where
  reactionQuotientClosed : E.reactionQuotient
  equilibriumConstantClosed : E.equilibriumConstant
  vanTHoffEquationClosed : E.vanTHoffEquation
  temperatureDependenceClosed : E.temperatureDependence
  standardStateClosed : E.standardState

def EquilibriumConstantClosed (E : EquilibriumConstantPackage) : Prop :=
  E.reactionQuotient ∧ E.equilibriumConstant ∧ E.vanTHoffEquation ∧ E.temperatureDependence ∧ E.standardState

theorem equilibrium_constant_closed_from_evidence (E : EquilibriumConstantPackage) (Ev : EquilibriumConstantEvidence E) :
    EquilibriumConstantClosed E := by
  exact And.intro Ev.reactionQuotientClosed
    (And.intro Ev.equilibriumConstantClosed
      (And.intro Ev.vanTHoffEquationClosed
        (And.intro Ev.temperatureDependenceClosed Ev.standardStateClosed)))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse