import ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean.HeatTransferConduction

namespace HautevilleHouse
namespace ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean

structure ConvectionTransferPackage where
  fluid : Type u
  flowField : Type v
  heatTransferCoefficient : Type w
  convectiveHeatFlux : Type x
  newtonCoolingLaw : Prop
  nusseltCorrelation : Prop
  boundaryLayerModel : Prop

structure ConvectionTransferEvidence (C : ConvectionTransferPackage) where
  newtonCoolingLawClosed : C.newtonCoolingLaw
  nusseltCorrelationClosed : C.nusseltCorrelation
  boundaryLayerModelClosed : C.boundaryLayerModel

def ConvectionTransferClosed (C : ConvectionTransferPackage) : Prop :=
  C.newtonCoolingLaw ∧ C.nusseltCorrelation ∧ C.boundaryLayerModel

theorem convection_transfer_closed_from_evidence (C : ConvectionTransferPackage) (E : ConvectionTransferEvidence C) :
    ConvectionTransferClosed C := by
  exact And.intro E.newtonCoolingLawClosed (And.intro E.nusseltCorrelationClosed E.boundaryLayerModelClosed)

end ChemicalKineticsThermodynamicsHeatTransferFoundationCanonicalLaneLean
end HautevilleHouse