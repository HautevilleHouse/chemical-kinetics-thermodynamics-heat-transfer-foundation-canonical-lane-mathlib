import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure HeatTransferEquationPackage where
  thermalConductivity : Prop
  specificHeat : Prop
  density : Prop
  temperatureField : Type u
  heatEquation : Prop
  boundaryConditions : Prop

structure HeatTransferEquationEvidence (H : HeatTransferEquationPackage) where
  thermalConductivityClosed : H.thermalConductivity
  specificHeatClosed : H.specificHeat
  densityClosed : H.density
  heatEquationClosed : H.heatEquation
  boundaryConditionsClosed : H.boundaryConditions

def HeatTransferEquationClosed (H : HeatTransferEquationPackage) : Prop :=
  H.thermalConductivity ∧ H.specificHeat ∧ H.density ∧ H.heatEquation ∧ H.boundaryConditions

theorem heat_transfer_equation_closed_from_evidence (H : HeatTransferEquationPackage) (E : HeatTransferEquationEvidence H) :
    HeatTransferEquationClosed H := by
  exact And.intro E.thermalConductivityClosed
    (And.intro E.specificHeatClosed
      (And.intro E.densityClosed
        (And.intro E.heatEquationClosed E.boundaryConditionsClosed)))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse