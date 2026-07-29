import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ThermodynamicPotentialPackage where
  gibbsFreeEnergy : Type u
  helmholtzFreeEnergy : Type v
  enthalpy : Type w
  internalEnergy : Type x
  fundamentalRelation : Prop
  legendreTransformDefined : Prop
  equilibriumMinimization : Prop

structure ThermodynamicPotentialEvidence (T : ThermodynamicPotentialPackage) where
  fundamentalRelationClosed : T.fundamentalRelation
  legendreTransformDefinedClosed : T.legendreTransformDefined
  equilibriumMinimizationClosed : T.equilibriumMinimization

def ThermodynamicPotentialClosed (T : ThermodynamicPotentialPackage) : Prop :=
  T.fundamentalRelation ∧ T.legendreTransformDefined ∧ T.equilibriumMinimization

theorem thermodynamic_potential_closed_from_evidence (T : ThermodynamicPotentialPackage) (E : ThermodynamicPotentialEvidence T) : ThermodynamicPotentialClosed T := by
  exact And.intro E.fundamentalRelationClosed (And.intro E.legendreTransformDefinedClosed E.equilibriumMinimizationClosed)

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse