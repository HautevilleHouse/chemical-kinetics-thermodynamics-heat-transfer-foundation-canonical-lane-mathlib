import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure HeatTransferModePackage where
  conductionFourierLaw : Prop
  convectionNewtonLaw : Prop
  radiationStefanBoltzmann : Prop
  heatEquation : Prop
  thermalBoundaryLayer : Prop
  overallHeatTransferCoefficient : Prop

structure HeatTransferModeEvidence (H : HeatTransferModePackage) where
  conductionFourierLawClosed : H.conductionFourierLaw
  convectionNewtonLawClosed : H.convectionNewtonLaw
  radiationStefanBoltzmannClosed : H.radiationStefanBoltzmann
  heatEquationClosed : H.heatEquation
  thermalBoundaryLayerClosed : H.thermalBoundaryLayer
  overallHeatTransferCoefficientClosed : H.overallHeatTransferCoefficient

def HeatTransferModeClosed (H : HeatTransferModePackage) : Prop :=
  H.conductionFourierLaw ∧ H.convectionNewtonLaw ∧ H.radiationStefanBoltzmann ∧
  H.heatEquation ∧ H.thermalBoundaryLayer ∧ H.overallHeatTransferCoefficient

theorem heat_transfer_mode_closed_from_evidence (H : HeatTransferModePackage) (E : HeatTransferModeEvidence H) : HeatTransferModeClosed H := by
  exact And.intro E.conductionFourierLawClosed
    (And.intro E.convectionNewtonLawClosed
      (And.intro E.radiationStefanBoltzmannClosed
        (And.intro E.heatEquationClosed
          (And.intro E.thermalBoundaryLayerClosed E.overallHeatTransferCoefficientClosed))))

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse