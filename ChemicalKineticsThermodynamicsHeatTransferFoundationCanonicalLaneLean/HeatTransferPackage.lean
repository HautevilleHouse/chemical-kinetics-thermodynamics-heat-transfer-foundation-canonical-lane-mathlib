import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure HeatTransferPackage where
  body : Type u
  temperature : body -> ℝ
  thermalConductivity : body -> ℝ
  heatFlux : body -> Prop
  fourierLaw : Prop
  convectionCoefficient : ℝ
  radiationEmissivity : ℝ

structure HeatTransferEvidence (H : HeatTransferPackage) where
  fourierLawClosed : H.fourierLaw
  heatConductionEquation : Prop
  heatConductionEquationClosed : heatConductionEquation
  boundaryConditions : Prop
  boundaryConditionsClosed : boundaryConditions

def HeatTransferClosed (H : HeatTransferPackage) : Prop :=
  H.fourierLaw ∧ H.heatFlux ∀ b, (∀ b, H.heatFlux b = -H.thermalConductivity b * (H.temperature b - 298.15)) ∧
  heatConductionEquation ∧ boundaryConditions

theorem heat_transfer_closed_from_evidence (H : HeatTransferPackage)
    (E : HeatTransferEvidence H) : HeatTransferClosed H :=
  And.intro E.fourierLawClosed (And.intro (by
    intro b
    have := E.fourierLawClosed
    sorry) (And.intro E.heatConductionEquationClosed E.boundaryConditionsClosed))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse